//
//  ProductServiceMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
import FashionDays

public class ProductServiceMock: NetworkService {

    public var networkController: FashionDays.CoreNetworkingAPIProtocol = CoreNetworkingControllerMock()
    
    public typealias RequestBody = Void
    
    public typealias ResponseModel = ProductsRemoteDataModel
    
    public var endPoint: FashionDays.ApiEndpoint = ApiEndpoint(url: URL(string: "https://m.fashiondays.com/mobile/9/g/women/clothing/")!,
                                                               headers: ["x-mobile-app-locale": "ro_RO"], method: .get)
}
