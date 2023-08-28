//
//  ProductUseCaseMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
@testable import Products

class ProductUseCaseMock: ProductUseCase {
         
    override func execute(_ parameters: ProductUseCase.In) async throws -> ProductUseCase.Out {
        return Array(arrayLiteral: productDomainModelStub)
    }
}
