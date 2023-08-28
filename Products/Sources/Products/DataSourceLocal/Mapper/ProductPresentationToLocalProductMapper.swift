//
//  ProductPresentationToLocalProductMapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Common
import Foundation

final class ProductPresentationToLocalProductMapper: Mapper {
    
    typealias In = [ProductPresentationModel]
    typealias Out = [ProductLocalDataModel]
    
    func map(_ value: In) -> Out {
        var output: [ProductLocalDataModel] = []
        for product in value {
            output.append(mapElement(product))
        }
        return output
    }
    
    func mapElement(_ value: ProductPresentationModel) -> ProductLocalDataModel {
        return .init(id: value.id,
                     name: value.name,
                     brand: value.brand,
                     price: value.price,
                     originalPrice: value.originalPrice,
                     stockState: mapStockState(value.stockState),
                     imagesListing: mapImages(value.imagesListing),
                     imagesDetail: mapImages(value.imagesDetail))
    }
    
    func mapImages(_ value: [URL]) -> [String] {
        var imagesStrings: [String] = []
        for url in value {
            imagesStrings.append(url.absoluteString)
        }
        return imagesStrings
    }
    
    func mapStockState(_ value: Bool) -> String {
        return value ? "ok" : ""
    }
}
