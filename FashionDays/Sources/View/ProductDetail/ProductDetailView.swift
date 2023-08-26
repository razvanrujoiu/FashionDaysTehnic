//
//  ProductDetailView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Bindable private var viewModel: ProductDetailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var product: ProductPresentationModel {
        viewModel.product
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(product.name)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text(product.brand)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .opacity(0.7)
                    HStack(spacing: 8) {
                        if product.originalPrice != product.price {
                            Text("\(String(product.originalPrice)) Lei")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .strikethrough()
                        }
                        Text("\(String(product.price)) Lei")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                    }
                    if product.stockState {
                        Text("In stoc")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundStyle(.green.opacity(0.7))
                    } else {
                        Text("Stoc epuizat")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .opacity(0.7)
                            .foregroundStyle(.red.opacity(0.7))
                    }
                }.padding(.all, 24)
                Spacer()
            }
        }.navigationTitle(product.name)
        .toolbarTitleDisplayMode(.inline)
    }
}
