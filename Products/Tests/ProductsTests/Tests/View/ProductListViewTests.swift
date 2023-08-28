//
//  ProductListViewTests.swift
//
//
//  Created by Razvan Rujoiu on 28.08.2023.
//

import XCTest
@testable import Products
import UIKit
import SwiftData
import SwiftUI

final class ProductListViewTests: XCTestCase {
    
    private var localDataToPresentationMapper: ProductLocalToPresentationMapper!
    private var presentationToLocalDataMapper: ProductPresentationToLocalProductMapper!
    
    override func setUp() {
        localDataToPresentationMapper = ProductLocalToPresentationMapper()
        presentationToLocalDataMapper = ProductPresentationToLocalProductMapper()
    }

    override func tearDown() {
        localDataToPresentationMapper = nil
        presentationToLocalDataMapper = nil
    }
    
    @MainActor
    func test_displaying_one_inserted_product() throws {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let inMemoryContainer = try! ModelContainer(for: ProductLocalDataModel.self,
                                                    configurations: configuration)
        let context = inMemoryContainer.mainContext
        
        context.insert(presentationToLocalDataMapper.mapElement(productPresentationModelDataStub))
        
        try context.save()
        
        let result = try context.fetch(FetchDescriptor<ProductLocalDataModel>())
        
        guard let firstElement = result.first else {
            XCTFail("Should have 1 product inserted")
            return
        }
        let sut = localDataToPresentationMapper.mapElement(firstElement)
        XCTAssertEqual(sut.id, productPresentationModelDataStub.id)
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
