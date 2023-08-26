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
    
    var products: [ProductPresentationModel] = []
    
    init() {
        self.productDomainFacade = ProductDomainFacade()
    }
    
    private var productDomainFacade: ProductDomainFacadeType
    
    func getProducts() async throws {
        let products = try await productDomainFacade.getProducts()
        self.products = products
    }
}
