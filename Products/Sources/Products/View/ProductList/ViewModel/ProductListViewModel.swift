//
//  ProductListViewModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Common
import Foundation
import SwiftUI

protocol ProductListViewModelType: Identifiable {
    func getProducts() async throws
}

@Observable
class ProductListViewModel: ProductListViewModelType {
    
    @ObservationIgnored let id = UUID()
    var loadingState: LoadingState = .not_available
    var products: [ProductPresentationModel] = []
    
    @ObservationIgnored
    @Inject
    var productDomainFacade: ProductDomainFacadeType
    
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
}
