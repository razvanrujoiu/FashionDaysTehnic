//
//  ProductUseCase.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public class ProductUseCase: UseCase {
    
    public typealias In = Void
    public typealias Out = [ProductDomainModel]
    
    @Inject private var dataRepository: ProductRepositoryType
    
    public func execute(_ parameters: In) async throws -> Out {
        try await dataRepository.requestProducts()
    }
}
