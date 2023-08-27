//
//  ProductUseCaseMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
import FashionDays

class ProductUseCaseMock: ProductUseCase {
     
    override init() { }
    
    override func execute(_ parameters: ProductUseCase.In) async throws -> ProductUseCase.Out {
        return Array(arrayLiteral: productDomainModelStub)
    }
}
