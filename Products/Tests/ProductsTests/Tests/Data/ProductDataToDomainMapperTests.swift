//
//  ProductDataToDomainMapperTests.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import XCTest
import Products

final class ProductDataToDomainMapperTests: XCTestCase {
    private var mapper: ProductDataToDomainMapper!
    
    override func setUp() {
        mapper = ProductDataToDomainMapper()
    }
    
    override func tearDown() {
        mapper = nil
    }
    
    func testMapElement_THEN_Mapped_Correctly() {
        let output = mapper.mapElement(productDataModelStub)
        
        XCTAssertEqual(output.id, productDomainModelStub.id)
        XCTAssertEqual(output.name, productDomainModelStub.name)
        XCTAssertEqual(output.brand, productDomainModelStub.brand)
        XCTAssertEqual(output.price, productDomainModelStub.price)
        XCTAssertEqual(output.originalPrice, productDomainModelStub.originalPrice)
        XCTAssertEqual(output.stockState, productDomainModelStub.stockState)
        for (index, element) in output.imagesListing.enumerated() {
            XCTAssertEqual(element, productDomainModelStub.imagesListing[index])
        }
        for (index, element) in output.imagesDetail.enumerated() {
            XCTAssertEqual(element, productDomainModelStub.imagesDetail[index])
        }
    }
}
