//
//  ProductDataToDomainMapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Common
import Foundation

final public class ProductDataToDomainMapper: Mapper {
    
    public typealias In = [ProductDataModel]
    public typealias Out = [ProductDomainModel]
    
    public init() {}
    
    public func map(_ value: In) -> Out {
        var output: [ProductDomainModel] = []
        for product in value {
            output.append(mapElement(product))
        }
        return output
    }
    
    public func mapElement(_ value: ProductDataModel) -> ProductDomainModel {
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
