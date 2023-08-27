//
//  ProductRemoteDataModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public struct ProductsRemoteDataModel: Decodable {
    public let products: [ProductRemoteDataModel]
}

public struct ProductRemoteDataModel: Decodable {
    public let id: Double
    public let name: String
    public let brand: String
    public let price: Double
    public let originalPrice: Double
    public let stockState: String
    public let images: ImagesDetail
    
    public init(id: Double,
         name: String,
         brand: String,
         price: Double,
         originalPrice: Double,
         stockState: String,
         images: ImagesDetail) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.originalPrice = originalPrice
        self.stockState = stockState
        self.images = images
    }
    
    private enum CodingKeys : String, CodingKey {
        case id = "product_id"
        case name = "product_name"
        case brand = "product_brand"
        case price = "product_price"
        case originalPrice = "product_original_price"
        case stockState = "product_stock_state"
        case images = "product_images"
    }
    
    public struct ImagesDetail: Decodable {
        public let listing: [String]
        public let detail: [String]
        
        public init(listing: [String], detail: [String]) {
            self.listing = listing
            self.detail = detail
        }
    }
}
