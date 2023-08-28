//
//  ProductDataSourceType.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

protocol ProductDataSourceType {
    func getProducts() async throws -> [ProductDataModel]
}
