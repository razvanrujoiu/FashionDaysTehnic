//
//  ProductRemoteDataModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

struct ProductsRemoteDataModel: Decodable {
    let products: [ProductRemoteDataModel]
}

struct ProductRemoteDataModel: Decodable {
    let id: Double
    let name: String
    let brand: String
    let price: Double
    let originalPrice: Double
    let stockState: String
    let images: ImagesDetail
    
    init(id: Double,
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
    
    struct ImagesDetail: Decodable {
        let listing: [String]
        let detail: [String]
        
        init(listing: [String], detail: [String]) {
            self.listing = listing
            self.detail = detail
        }
    }
}
