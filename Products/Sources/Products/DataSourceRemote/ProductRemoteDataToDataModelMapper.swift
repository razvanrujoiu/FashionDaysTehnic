//
//  ProductRemoteDataToDataModelMapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation
import Common

class ProductRemoteDataToDataModelMapper: Mapper {
    
    typealias In = ProductsRemoteDataModel
    typealias Out = [ProductDataModel]
        
    func map(_ value: In) -> Out {
        var output: [ProductDataModel] = []
        for product in value.products {
            output.append(mapElement(product))
        }
        return output
    }
    
    func mapElement(_ value: ProductRemoteDataModel) -> ProductDataModel {
        return .init(id: value.id,
                     name: value.name,
                     brand: value.brand,
                     price: value.price,
                     originalPrice: value.originalPrice,
                     stockState: value.stockState,
                     imagesListing: value.images.listing,
                     imagesDetail: value.images.detail)
    }
}
