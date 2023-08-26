//
//  ProductDataToLocalModelMapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation

class ProductDataToLocalModelMapper: Mapper {
    
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
