//
//  ProductRemoteDataToDataModelMapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

class ProductRemoteDataToDataModelMapper: Mapper {
    
    typealias In = [ProductRemoteDataModel]
    typealias Out = [ProductDataModel]
    
    func map(_ value: In) -> Out {
        var output: [ProductDataModel] = []
        for product in value {
            output.append(mapElement(product))
        }
        return output
    }
    
    func mapElement(_ value: ProductRemoteDataModel) -> ProductDataModel {
        return .init(id: value.id,
                     name: value.name,
                     brand: value.brand,
                     price: value.price,
                     stockState: value.stockState,
                     images: value.images.images)
    }
}
