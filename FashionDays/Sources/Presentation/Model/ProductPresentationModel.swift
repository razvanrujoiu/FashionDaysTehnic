//
//  ProductPresentationModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public struct ProductPresentationModel: Hashable {
    public let id: Double
    public let name: String
    public let brand: String
    public let price: Double
    public let originalPrice: Double
    public let stockState: String
    public let imagesListing: [URL]
    public let imagesDetail: [URL]
    
    init(id: Double,
         name: String,
         brand: String,
         price: Double,
         originalPrice: Double,
         stockState: String,
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
