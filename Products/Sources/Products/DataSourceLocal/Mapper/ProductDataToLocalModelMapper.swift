//
//  ProductDataToLocalModelMapper.swift
//
//
//  Created by Razvan Rujoiu on 30.08.2023.
//

import Common
import Foundation

final class ProductDataToLocalModelMapper: Mapper {
    
    typealias In = [ProductDataModel]
    typealias Out = [ProductLocalDataModel]
    
    func map(_ value: In) -> Out {
        var output: [ProductLocalDataModel] = []
        for product in value {
            output.append(mapElement(product))
        }
        return output
    }
    
    func mapElement(_ value: ProductDataModel) -> ProductLocalDataModel {
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

