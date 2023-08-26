//
//  ProductDataToDomainMapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

final class ProductDataToDomainMapper: Mapper {
    
    typealias In = [ProductDataModel]
    typealias Out = [ProductDomainModel]
    
    func map(_ value: In) -> Out {
        var output: [ProductDomainModel] = []
        for product in value {
            output.append(mapElement(product))
        }
        return output
    }
    
    func mapElement(_ value: ProductDataModel) -> ProductDomainModel {
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
