//
//  ProductDomainModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public struct ProductDomainModel {
    public let id: Double
    public let name: String
    public let brand: String
    public let price: Double
    public let stockState: String
    public let images: [String]
    
    init(id: Double, name: String, brand: String, price: Double, stockState: String, images: [String]) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.stockState = stockState
        self.images = images
    }
}
