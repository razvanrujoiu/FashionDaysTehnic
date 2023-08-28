//
//  ProductPresentationModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

struct ProductPresentationModel: Hashable {
    let id: Double
    let name: String
    let brand: String
    let price: Double
    let originalPrice: Double
    let stockState: Bool
    let imagesListing: [URL]
    let imagesDetail: [URL]
    
    init(id: Double,
         name: String,
         brand: String,
         price: Double,
         originalPrice: Double,
         stockState: Bool,
         imagesListing: [URL],
         imagesDetail: [URL]) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.originalPrice = originalPrice
        self.stockState = stockState
        self.imagesListing = imagesListing
        self.imagesDetail = imagesDetail
    }
}
