//
//  ProductDomainToPresentationMapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

class ProductDomainToPresentationMapper: Mapper {
    
    typealias In = [ProductDomainModel]
    typealias Out = [ProductPresentationModel]
    
    func map(_ value: In) -> Out {
        var output: [ProductPresentationModel] = []
        for product in value {
            output.append(mapElement(product))
        }
        return output
    }
    
    func mapElement(_ value: ProductDomainModel) -> ProductPresentationModel {
        return .init(id: value.id,
                     name: value.name,
                     brand: value.brand,
                     price: value.price,
                     stockState: value.stockState,
                     images: value.images)
    }
}
