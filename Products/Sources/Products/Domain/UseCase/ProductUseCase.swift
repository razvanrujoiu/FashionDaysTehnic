//
//  ProductUseCase.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Common
import Foundation

class ProductUseCase: UseCase {
    
    typealias In = Void
    typealias Out = [ProductDomainModel]
        
    @Inject private var dataRepository: ProductRepositoryType
    
    func execute(_ parameters: In) async throws -> Out {
        try await dataRepository.requestProducts()
    }
}
