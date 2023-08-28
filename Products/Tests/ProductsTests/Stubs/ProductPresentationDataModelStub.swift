//
//  ProductPresentationDataModelStub.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
@testable import Products

let productPresentationModelDataStub = ProductPresentationModel(id: 123,
                                                                 name: "Tricou",
                                                                 brand: "Nike",
                                                                 price: 100,
                                                                 originalPrice: 200,
                                                                 stockState: true,
                                                                       imagesListing: [URL(string: "https://fdcdn.akamaized.net/m/160x240/products/58352/58351033/images/res_1bb60c59572a03146e8792724e45cf18.jpg?s=TMU22buO3jbw")!],
                                                                       imagesDetail: [URL(string: "https://fdcdn.akamaized.net/m/250x375/products/58352/58351033/images/res_1bb60c59572a03146e8792724e45cf18.jpg?s=9onerVpVwal9")!])
