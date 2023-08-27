//
//  ProductDataRepositoryTests.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import XCTest
import Products

final class ProductDataRepositoryTests: XCTestCase {
    private var mapper: ProductDataToDomainMapper!
    private var productDataRepositoryMock: ProductDataRepositoryMock!
    
    override func setUp() {
        mapper = ProductDataToDomainMapper()
        productDataRepositoryMock = ProductDataRepositoryMock()
    }
    
    override func tearDown() {
        mapper = nil
        productDataRepositoryMock = nil
    }
    
    func testRequestProducts() async throws {
        
        let products = try await productDataRepositoryMock.requestProducts()
        guard let product = products.first else {
            XCTFail("Products should have elements")
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
