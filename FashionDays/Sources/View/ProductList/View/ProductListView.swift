//
//  ProductListView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    
    @Environment(ProductListCoordinator.self) private var coordinator
    @State private var viewModel = ProductListViewModel()
    @State private var searchText: String = ""
    
    var searchResults: [ProductPresentationModel] {
        if searchText.isEmpty {
            return viewModel.products
        } else {
            return viewModel.products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            switch viewModel.loadingState {
            case .not_available:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                List {
                    if searchResults.isEmpty {
                        Text("No results found")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(.black.opacity(0.7))
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
                .searchable(text: $searchText)
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            case .failed(let error):
                VStack(spacing: 4) {
                    Text("\(error.localizedDescription)")
                    Button {
                        Task {
                            await viewModel.getProducts()
                        }
                    } label: {
                        Text("Retry")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(.blue.opacity(0.7))
                    }
                }
            }
            
        }
        .navigationTitle("Fashion Days")
        .task {
            await viewModel.getProducts()
        }
    }
}
