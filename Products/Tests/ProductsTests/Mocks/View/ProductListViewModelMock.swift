//
//  ProductListViewModelMock.swift
//
//
//  Created by Razvan Rujoiu on 28.08.2023.
//

import Foundation
import Products

class ProductListViewModelMock: ProductListViewModelType {
    
    var products: [ProductPresentationModel] = []
    
    func getProducts() async throws {
        products.append(productPresentationModelDataStub)
    }
}
