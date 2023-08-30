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
    @Inject var productLocalService: ProductLocalService
    
    func getLocalProducts() async throws -> [ProductLocalDataModel] {
        try await productLocalService.getLocalProducts()
    }
     
    func insertProducts(products: [ProductDataModel]) async {
        await productLocalService.insertProducts(products: dataToLocalMapper.map(products))
    }
}

extension ProductLocalDataSource: ProductDataSourceType {
    
    func getProducts() async throws -> [ProductDataModel] {
        let products = try await getLocalProducts()
        return localToDataMapper.map(products)
    }
}
