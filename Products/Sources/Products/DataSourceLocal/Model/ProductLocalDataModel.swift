//
//  ProductLocalDataModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
import SwiftData

@Model
public class ProductLocalDataModel: Identifiable {
    @Attribute(.unique) public var id: Double
    var name: String
    var brand: String
    var price: Double
    var originalPrice: Double
    var stockState: String
    var imagesListing: [String]
    var imagesDetail: [String]
    
    init(id: Double, name: String, brand: String, price: Double, originalPrice: Double, stockState: String, imagesListing: [String], imagesDetail: [String]) {
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
