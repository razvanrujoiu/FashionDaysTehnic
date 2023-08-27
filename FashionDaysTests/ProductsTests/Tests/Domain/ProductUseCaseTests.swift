//
//  ProductUseCaseTests.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
import XCTest
import FashionDays

final class ProductUseCaseTests: XCTestCase {
    
    private var productUseCaseMock: ProductUseCaseMock!
    
    override func setUp() {
        productUseCaseMock = ProductUseCaseMock()
    }
    
    override func tearDown() {
        productUseCaseMock = nil
    }
    
    func testUseCaseExecuteMethod() async throws {
        let result = try await productUseCaseMock.execute(())
        guard let product = result.first else {
            XCTFail("Collection shouldn't be empty")
            return
        }
        XCTAssertEqual(product.id, productDomainModelStub.id)
        XCTAssertEqual(product.name, productDomainModelStub.name)
        XCTAssertEqual(product.brand, productDomainModelStub.brand)
        XCTAssertEqual(product.price, productDomainModelStub.price)
        XCTAssertEqual(product.originalPrice, productDomainModelStub.originalPrice)
        XCTAssertEqual(product.stockState, productDomainModelStub.stockState)
        for (index, element) in product.imagesListing.enumerated() {
            XCTAssertEqual(element, productDomainModelStub.imagesListing[index])
        }
        for (index, element) in product.imagesDetail.enumerated() {
            XCTAssertEqual(element, productDomainModelStub.imagesDetail[index])
        }
    }
}
