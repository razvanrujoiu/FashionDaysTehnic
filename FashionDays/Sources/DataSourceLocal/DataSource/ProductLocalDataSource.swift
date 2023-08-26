//
//  ProductLocalDataSource.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
import SwiftData
import SwiftUI

protocol ProductLocalDataSourceType {
    func insertProducts(products: [ProductDataModel])
}

class ProductLocalDataSource: ProductLocalDataSourceType {
   
    @Environment(\.modelContext) private var context
    @Inject private var localToDataMapper: ProductLocalToDataModelMapper
    @Inject private var dataToLocalMapper: ProductDataToLocalModelMapper
    
    func insertProduct(product: ProductLocalDataModel) {
//        context.insert(product)
    }
    
    func insertProducts(products: [ProductDataModel]) {
        let localProducts = dataToLocalMapper.map(products)
        for product in localProducts {
            insertProduct(product: product)
        }
    }
}
