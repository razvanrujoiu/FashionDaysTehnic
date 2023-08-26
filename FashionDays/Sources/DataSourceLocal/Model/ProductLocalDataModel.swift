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
    public var name: String
    public var brand: String
    public var price: Double
    public var originalPrice: Double
    public var stockState: String
    public var imagesListing: [String]
    public var imagesDetail: [String]
    
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
