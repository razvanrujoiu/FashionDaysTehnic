//
//  ProductListViewModelTests.swift
//
//
//  Created by Razvan Rujoiu on 28.08.2023.
//

import Products
import XCTest

final class ProductListViewModelTests: XCTestCase {
    
    private var productListViewModel: ProductListViewModelMock!
    
    override func setUp() {
        productListViewModel = ProductListViewModelMock()
    }
    
    override func tearDown() {
        productListViewModel = nil
    }
    
    func test_Get_Products() async throws {
        try await productListViewModel.getProducts()
        guard let sut = productListViewModel.products.first else {
            XCTFail("Should have one product")
            return
        }
        XCTAssertEqual(sut.id, productPresentationModelDataStub.id)
        XCTAssertEqual(sut.name, productPresentationModelDataStub.name)
        XCTAssertEqual(sut.brand, productPresentationModelDataStub.brand)
        XCTAssertEqual(sut.price, productPresentationModelDataStub.price)
        XCTAssertEqual(sut.originalPrice, productPresentationModelDataStub.originalPrice)
        XCTAssertEqual(sut.stockState, productPresentationModelDataStub.stockState)
        for (index, element) in sut.imagesListing.enumerated() {
            XCTAssertEqual(element, productPresentationModelDataStub.imagesListing[index])
        }
        for (index, element) in sut.imagesDetail.enumerated() {
            XCTAssertEqual(element, productPresentationModelDataStub.imagesDetail[index])
        }
    }
}
