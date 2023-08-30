//
//  ProductLocalToDataModelMapper.swift
//
//
//  Created by Razvan Rujoiu on 30.08.2023.
//

import Common
import Foundation

final class ProductLocalToDataModelMapper: Mapper {
    
    typealias In = [ProductLocalDataModel]
    typealias Out = [ProductDataModel]
    
    func map(_ value: In) -> Out {
        var output: [ProductDataModel] = []
        for product in value {
            output.append(mapElement(product))
        }
        return output
    }
    
    func mapElement(_ value: ProductLocalDataModel) -> ProductDataModel {
        return .init(id: value.id,
                     name: value.name,
                     brand: value.brand,
                     price: value.price,
                     originalPrice: value.originalPrice,
                     stockState: value.stockState,
                     imagesListing: value.imagesListing,
                     imagesDetail: value.imagesDetail)
    }
}
