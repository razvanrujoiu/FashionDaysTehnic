//
//  ProductListView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import SwiftUI

struct ProductListView: View {
    
    @State private var viewModel = ProductListViewModel()
        
    var body: some View {
        List {
            ForEach(viewModel.products, id: \.self) { product in
                VStack {
                    Text(product.name)
                    Text(product.brand)
                    Text(String(product.price))
                }
            }.onMove(perform: { indices, newOffset in
                viewModel.products.move(fromOffsets: indices, toOffset: newOffset)
            })
        }
        .task {
            do {
                try await viewModel.getProducts()
            } catch {
                print(error)
            }
        }
    }
}
