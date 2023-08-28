//
//  ProductDomainFacade.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

protocol ProductDomainFacadeType {
    func getProducts() async throws -> [ProductPresentationModel]
}

class ProductDomainFacade: ProductDomainFacadeType {
        
    @Inject private var productUseCase: ProductUseCase
    @Inject private var mapper: ProductDomainToPresentationMapper
    
    func getProducts() async throws -> [ProductPresentationModel] {
        let domainResult = try await productUseCase.execute(())
        return mapper.map(domainResult)
    }
}
