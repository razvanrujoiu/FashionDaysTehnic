//
//  ProductServiceMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
@testable import Products
import Common

class ProductServiceMock: NetworkService {

    var networkController: CoreNetworkingAPIProtocol = CoreNetworkingControllerMock()
    
    typealias RequestBody = Void
    
    typealias ResponseModel = ProductsRemoteDataModel
    
    var endPoint: ApiEndpoint = ApiEndpoint(url: URL(string: "https://m.fashiondays.com/mobile/9/g/women/clothing/")!,
                                                               headers: ["x-mobile-app-locale": "ro_RO"], method: .get)
}
