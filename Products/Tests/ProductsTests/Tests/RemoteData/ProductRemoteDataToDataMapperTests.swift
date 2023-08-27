//
//  ProductRemoteDataToDataMapperTests.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import XCTest
import Products

final class ProductRemoteDataToDataMapperTests: XCTestCase {
    
    private var mapper: ProductRemoteDataToDataModelMapper!

    override func setUp() {
        mapper = ProductRemoteDataToDataModelMapper()
    }
    
    override func tearDown() {
        mapper = nil
    }

    func testMapElement_THEN_Mapped_Correctly() {
        let output = mapper.mapElement(productRemoteDataModelStub)
        
        XCTAssertEqual(output.id, productDataModelStub.id)
        XCTAssertEqual(output.name, productDataModelStub.name)
        XCTAssertEqual(output.brand, productDataModelStub.brand)
        XCTAssertEqual(output.price, productDataModelStub.price)
        XCTAssertEqual(output.originalPrice, productDataModelStub.originalPrice)
        XCTAssertEqual(output.stockState, productDataModelStub.stockState)
        for (index, element) in output.imagesListing.enumerated() {
            XCTAssertEqual(element, productDataModelStub.imagesListing[index])
        }
        for (index, element) in output.imagesDetail.enumerated() {
            XCTAssertEqual(element, productDataModelStub.imagesDetail[index])
        }
    }
}
