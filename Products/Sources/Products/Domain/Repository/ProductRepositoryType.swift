//
//  ProductRepositoryType.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public protocol ProductRepositoryType {
    func requestProducts() async throws -> [ProductDomainModel]
}
