//
//  ProductRemoteDataSourceTests.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import XCTest

final class ProductRemoteDataSourceTests: XCTestCase {
    
    var productRemoteDataSourceMock: ProductRemoteDataSourceMock!

    override func setUp() {
        productRemoteDataSourceMock = ProductRemoteDataSourceMock()
    }
    
    override func tearDown() {
        productRemoteDataSourceMock = nil
    }
    
    func test_Request_Successfull() async throws {
        
        let output = try await productRemoteDataSourceMock.getRemoteProducts()
        guard let product = output.products.first else {
            XCTFail("Test failed, should have 1 entry")
            return
        }
        XCTAssertEqual(product.id, 4726850)
        XCTAssertEqual(product.name, "Colanti cu tehnologie Dri-Fit si talie inalta pentru fitness One")
        XCTAssertEqual(product.price, 104.99)
        XCTAssertEqual(product.originalPrice, 234.99)
        XCTAssertEqual(product.brand, "Nike")
        XCTAssertEqual(product.stockState, "ok")
        XCTAssertEqual(product.images.detail.first!, "https://fdcdn.akamaized.net/m/250x375/products/42235/42234530/images/res_700a9d74ae41f694ef391d3cfbe0a62a.jpg?s=oXGChrPIRQBV")
        XCTAssertEqual(product.images.listing.first!, "https://fdcdn.akamaized.net/m/160x240/products/42235/42234530/images/res_700a9d74ae41f694ef391d3cfbe0a62a.jpg?s=2pdRuTtZa4sq")
    }
    
}
