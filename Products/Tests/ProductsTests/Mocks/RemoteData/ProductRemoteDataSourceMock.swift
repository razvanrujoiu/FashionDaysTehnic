//
//  ProductRemoteDataSourceMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
@testable import Products

class ProductRemoteDataSourceMock: ProductRemoteDataSourceType {
    
    func getRemoteProducts() async throws -> ProductsRemoteDataModel {
        try await ProductServiceMock().sendRequest()
    }
}
