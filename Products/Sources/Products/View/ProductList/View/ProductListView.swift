//
//  ProductListView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Common
import SwiftUI
import SwiftData
import OSLog

public struct ProductListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var localProducts: [ProductLocalDataModel]
    
    @Environment(ProductListCoordinator.self) private var coordinator
    @State private var viewModel = ProductListViewModel()
    @State private var searchText: String = ""
    
    @Inject private var localToPresentationMapper: ProductLocalToPresentationMapper
    @Inject private var presentationToLocalMapper: ProductPresentationToLocalProductMapper
    
    var searchResults: [ProductPresentationModel] {
        if searchText.isEmpty {
            return viewModel.products
        } else {
            return viewModel.products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    public init() { }
    
    public var body: some View {
        VStack {
            switch viewModel.loadingState {
            case .not_available:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                List {
                    if searchResults.isEmpty {
                        NoResultsView()
                    } else {
                        ForEach(searchResults, id: \.self) { product in
                            ProductItemCell(product: product) {
                                coordinator.push(page: .productDetail(product: product))
                            }.listRowSeparator(.hidden)
                                .listRowBackground(Color.gray.opacity(0.2))
                        }
                        .onMove(perform: { indices, newOffset in
                            viewModel.products.move(fromOffsets: indices, toOffset: newOffset)
                        })
                    }
                }
                .refreshable {
                    Task {
                        await viewModel.getProducts()
                    }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            case .failed(let error):
                ProductsErrorView(errorMessage: error.localizedDescription) {
                    Task {
                        await viewModel.getProducts()
                    }
                }
            }
        }
        .navigationTitle("Fashion Days")
        .task {
            await getProducts()
        }
    }
    
    ///  The `Query` property wrapper needs to be attached to a `View` in order to work
    ///  thus i couldn't implement  a proper LocalData layer, this a workaround for integrating
    ///  SwiftData in CLEAN architecture
    func getProducts() async {
        if localProducts.isEmpty {
            await viewModel.getProducts()
            for product in presentationToLocalMapper.map(viewModel.products) {
                modelContext.insert(product)
            }
            do {
                try modelContext.save()
            } catch {
                Logger.viewCycle.error("\(error.localizedDescription)")
            }
        } else {
            viewModel.products = localToPresentationMapper.map(localProducts)
            viewModel.loadingState = .success
        }
    }
}
