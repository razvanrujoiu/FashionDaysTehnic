//
//  ProductDomainToPresentationMapperTests.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import XCTest
@testable import Products

final class ProductDomainToPresentationMapperTests: XCTestCase {
    private var mapper: ProductDomainToPresentationMapper!
    
    override func setUp() {
        mapper = ProductDomainToPresentationMapper()
    }
    
    override func tearDown() {
        mapper = nil
    }
    
    func testMapElement_THEN_Mapped_Correctly() {
        let output = mapper.mapElement(productDomainModelStub)
        
        XCTAssertEqual(output.id, productPresentationModelDataStub.id)
        XCTAssertEqual(output.name, productPresentationModelDataStub.name)
        XCTAssertEqual(output.brand, productPresentationModelDataStub.brand)
        XCTAssertEqual(output.price, productPresentationModelDataStub.price)
        XCTAssertEqual(output.originalPrice, productPresentationModelDataStub.originalPrice)
        XCTAssertEqual(output.stockState, productPresentationModelDataStub.stockState)
        for (index, element) in output.imagesListing.enumerated() {
            XCTAssertEqual(element, productPresentationModelDataStub.imagesListing[index])
        }
        for (index, element) in output.imagesDetail.enumerated() {
            XCTAssertEqual(element, productPresentationModelDataStub.imagesDetail[index])
        }
    }
}
