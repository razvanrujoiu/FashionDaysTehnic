//
//  ProductListView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var localProducts: [ProductLocalDataModel]
    @Environment(ProductListCoordinator.self) private var coordinator
    @State private var viewModel = ProductListViewModel()
      
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.products, id: \.self) { product in
                    ProductItemCell(product: product) {
                        coordinator.push(page: .productDetail(product: product))
                    }.listRowSeparator(.hidden)
                        .listRowBackground(Color.gray.opacity(0.2))
                }
                .onMove(perform: { indices, newOffset in
                    viewModel.products.move(fromOffsets: indices, toOffset: newOffset)
                })
            }.listStyle(.plain)
            .scrollIndicators(.hidden)
        }
        .navigationTitle("Fashion Days")
        .task {
            if localProducts.isEmpty {
                await viewModel.getProducts()
                
            }
        }
    }
}
