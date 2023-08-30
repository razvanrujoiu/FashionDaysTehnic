//
//  ProductLocalDataSource.swift
//
//
//  Created by Razvan Rujoiu on 30.08.2023.
//

import Foundation
import SwiftData
import OSLog
import SwiftUI

protocol ProductLocalDataSourceType {
    func getLocalProducts() async throws -> [ProductLocalDataModel]
    func insertProducts(products: [ProductDataModel]) async throws
}

class ProductLocalDataSource: ProductLocalDataSourceType {
    
    @Inject var localToDataMapper: ProductLocalToDataModelMapper
    @Inject var dataToLocalMapper: ProductDataToLocalModelMapper
    var productLocalService: ProductLocalService?
    
    init() {
        productLocalService = ProductLocalService()
    }
    
    func getLocalProducts() async throws -> [ProductLocalDataModel] {
        guard let productLocalService = productLocalService else { return [] }
        return try await productLocalService.getLocalProducts()
    }
     
    func insertProducts(products: [ProductDataModel]) async {
        guard let productLocalService = productLocalService else { return }
        await productLocalService.insertProducts(products: dataToLocalMapper.map(products))
    }
}

extension ProductLocalDataSource: ProductDataSourceType {
    
    func getProducts() async throws -> [ProductDataModel] {
        let products = try await getLocalProducts()
        return localToDataMapper.map(products)
    }
}
