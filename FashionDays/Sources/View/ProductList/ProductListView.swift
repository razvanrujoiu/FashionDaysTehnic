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
        VStack {
            Text("hello")
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
