//
//  ProductService.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Common
import Foundation

final class ProductService: NetworkService {

    typealias RequestBody = Void
    typealias ResponseModel = ProductsRemoteDataModel
    
    struct Parameters {
        let url: URL
        let headers: HTTPHeaders
        let coreNetworkingAPI: CoreNetworkingAPIProtocol
    }
    
    var endPoint: ApiEndpoint {
        ApiEndpoint(url: url, headers: headers, method: .get)
    }
    
    var networkController: CoreNetworkingAPIProtocol {
        coreNetworkingAPI
    }
    
    let coreNetworkingAPI: CoreNetworkingAPIProtocol
    let url: URL
    let headers: HTTPHeaders
    
    init(parameters: Parameters) {
        self.url = parameters.url
        self.headers = parameters.headers
        self.coreNetworkingAPI = parameters.coreNetworkingAPI
    }
}
