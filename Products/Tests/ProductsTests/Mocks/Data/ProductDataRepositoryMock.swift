//
//  ProductDataRepositoryMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
@testable import Products

class ProductDataRepositoryMock: ProductRepositoryType {
    
    func requestProducts() async throws -> [ProductDomainModel] {
        return [productDomainModelStub]
    }
}
