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
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 12)]
    
    var body: some View {
        VStack {
            switch viewModel.loadingState {
            case .not_available:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                if isShowingGrid {
                    ProductsGrid().transition(.opacity)
                } else {
                    ProductsList().transition(.opacity)
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
                    withAnimation {
                        isShowingGrid.toggle()
                    }
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
                NoResultsView().listRowSeparator(.hidden)
            } else {
                ForEach(searchResults, id: \.self) { product in
                    ProductListItemCell(product: product) {
                        coordinator.push(page: .productDetail(product: product))
                    }.listRowSeparator(.hidden)
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
            if searchResults.isEmpty {
                NoResultsView().listRowSeparator(.hidden)
            } else {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(searchResults, id: \.self) { product in
                        ProductsGridItemCell(product: product) {
                            coordinator.push(page: .productDetail(product: product))
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .refreshable {
            Task {
                await viewModel.getProducts()
            }
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
       
    }
}
