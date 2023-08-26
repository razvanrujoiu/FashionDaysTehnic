//
//  ProductRemoteDataModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

struct ProductRemoteDataModel: Decodable {
    let id: String
    let name: String
    let brand: String
    let price: Double
    let stockState: String
    let images: ImagesDetail
    
    private enum CodingKeys : String, CodingKey {
        case id = "product_id"
        case name = "product_name"
        case brand = "product_brand"
        case price = "product_price"
        case stockState = "product_stock_state"
        case images = "product_images"
    }
    
    struct ImagesDetail: Decodable {
        let images: [String]
        
        private enum CodingKeys: String, CodingKey {
            case images = "detail"
        }
    }
}
