//
//  ProductRemoteDataSource.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Common
import Foundation

protocol ProductRemoteDataSourceType {
    func getRemoteProducts() async throws -> ProductsRemoteDataModel
}

class ProductRemoteDataSource: ProductRemoteDataSourceType {
    
    @Inject private var mapper: ProductRemoteDataToDataModelMapper
    @Inject private var coreNetworkingAPI: CoreNetworkingAPIProtocol
        
    private var url: URL {
        guard let url = URL(string: "https://m.fashiondays.com/mobile/9/g/women/clothing/") else {
            preconditionFailure("URL not valid")
        }
        return url
    }
    
    private var headers: HTTPHeaders {
        return ["x-mobile-app-locale": "ro_RO"]
    }
    
    private func buildProductService() -> ProductService {
        let parameters = ProductService.Parameters(url: url,
                                                   headers: headers,
                                                   coreNetworkingAPI: coreNetworkingAPI)
        return ProductService(parameters: parameters)
    }
    
    func getRemoteProducts() async throws -> ProductsRemoteDataModel {
        try await buildProductService().sendRequest()
    }
}

extension ProductRemoteDataSource: ProductDataSourceType {
    
    func getProducts() async throws -> [ProductDataModel] {
        let products = try await self.getRemoteProducts()
        return mapper.map(products)
    }
}
