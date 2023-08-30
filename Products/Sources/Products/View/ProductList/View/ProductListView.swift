//
//  ProductListView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Common
import SwiftUI
import OSLog
import Kingfisher

struct ProductListView: View {
        
    @Environment(ProductListCoordinator.self) private var coordinator
    @State private var viewModel = ProductListViewModel()
    @State private var searchText: String = ""
    @State private var isShowingGrid: Bool = false
    
    var searchResults: [ProductPresentationModel] {
        if searchText.isEmpty {
            return viewModel.products
        } else {
            return viewModel.products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 20)]
    
    var body: some View {
        VStack {
            switch viewModel.loadingState {
            case .not_available:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                if isShowingGrid {
                    ProductsGrid()
                } else {
                    ProductsList()
                }
            case .failed(let error):
                ProductsErrorView(errorMessage: error.localizedDescription) {
                    Task {
                        await viewModel.getProducts()
                    }
                }
            }
        }
        .navigationTitle("Fashion Days")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    isShowingGrid.toggle()
                }, label: {
                    isShowingGrid ? Image(systemName: "list.bullet") : Image(systemName: "square.grid.2x2")
                })
            }
        }
        .task {
            await viewModel.getProducts()
        }
    }
}

extension ProductListView {
    
    @ViewBuilder
    func ProductsList() -> some View {
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
    }
    
    @ViewBuilder
    func ProductsGrid() -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(searchResults, id: \.self) { product in
                    ProductsGridItemCell(product: product) {
                        coordinator.push(page: .productDetail(product: product))
                    }
                }
            }
            .padding(.horizontal)
        }.background(Color.gray.opacity(0.2))
    }
}
