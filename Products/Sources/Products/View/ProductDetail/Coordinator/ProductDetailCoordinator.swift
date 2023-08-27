//
//  ProductDetailCoordinator.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import SwiftUI

struct ProductDetailCoordinatorView: View {
    
    @State private var productViewModel: ProductDetailViewModel
    
    init(product: ProductPresentationModel) {
        _productViewModel = State(wrappedValue: ProductDetailViewModel(product: product))
    }
    
    var body: some View {
        ProductDetailView(viewModel: productViewModel)
    }
}
