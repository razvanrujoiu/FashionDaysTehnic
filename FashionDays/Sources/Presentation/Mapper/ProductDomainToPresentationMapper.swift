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
                     originalPrice: value.originalPrice,
                     stockState: mapStockState(value.stockState),
                     imagesListing: mapImages(value.imagesListing),
                     imagesDetail: mapImages(value.imagesDetail))
    }
    
    func mapImages(_ value: [String]) -> [URL] {
        var imagesUrls: [URL] = []
        for imageString in value {
            if let url = URL(string: imageString) {
                imagesUrls.append(url)
            }
        }
        return imagesUrls
    }
    
    func mapStockState(_ value: String) -> Bool {
        return value == "ok" ? true : false
    }
}
