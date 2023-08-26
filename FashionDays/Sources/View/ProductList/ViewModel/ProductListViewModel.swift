//
//  ProductListViewModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation
import SwiftUI

protocol ProductListViewModelType: Identifiable {
    func getProducts() async throws
}

@Observable
class ProductListViewModel: ProductListViewModelType {
    
    let id = UUID()
    var loadingState: LoadingState = .not_available
    var products: [ProductPresentationModel] = []
    
    init() {
        self.productDomainFacade = ProductDomainFacade()
    }
    
    private var productDomainFacade: ProductDomainFacadeType
    
    func getProducts() async {
        self.loadingState = .loading
        do {
            let products = try await productDomainFacade.getProducts()
            self.products = products
            self.loadingState = .success
        } catch {
            self.loadingState = .failed(error: error)
        }
    }
    
//    func pushDetail(product: ProductPresentationModel) {
//        coordinator.push(page: .productDetail(product: product))
//    }
}
