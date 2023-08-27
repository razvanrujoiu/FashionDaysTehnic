//
//  ProductUseCase.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

open class ProductUseCase: UseCase {
    
    public typealias In = Void
    public typealias Out = [ProductDomainModel]
    
    public init() { }
    
    @Inject private var dataRepository: ProductRepositoryType
    
    open func execute(_ parameters: In) async throws -> Out {
        try await dataRepository.requestProducts()
    }
}
