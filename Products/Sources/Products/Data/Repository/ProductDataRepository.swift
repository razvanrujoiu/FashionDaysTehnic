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
    @Inject private var localDataSource: ProductLocalDataSource
    @Inject private var remoteDataSource: ProductRemoteDataSource
    
    func requestDataProducts() async throws -> [ProductDataModel] {
        var products: [ProductDataModel] = []
        products = try await localDataSource.getProducts()
        if products.isEmpty {
            products =  try await remoteDataSource.getProducts()
            await localDataSource.insertProducts(products: products)
        }
        return products
    }
}

extension ProductDataRepository: ProductRepositoryType {
    func requestProducts() async throws -> [ProductDomainModel] {
        let result = try await requestDataProducts()
        return mapper.map(result)
    }
}
