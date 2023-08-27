//
//  ProductDataRepository.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

protocol ProductDataRepositoryType {
    func requestDataProducts() async throws -> [ProductDataModel]
}

class ProductDataRepository: ProductDataRepositoryType {
    
    @Inject private var mapper: ProductDataToDomainMapper
    @Inject private var dataSource: ProductDataSourceType
    
    func requestDataProducts() async throws -> [ProductDataModel] {
        try await dataSource.getProducts()
    }
}

extension ProductDataRepository: ProductRepositoryType {
    func requestProducts() async throws -> [ProductDomainModel] {
        let result = try await requestDataProducts()
        return mapper.map(result)
    }
}
