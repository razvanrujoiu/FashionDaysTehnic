//
//  NetworkService.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public protocol Service {
    associatedtype RequestBody
    associatedtype ResponseModel
    
    var endPoint: ApiEndpoint { get }
}

public protocol NetworkService: Service {
    var networkController: CoreNetworkingAPIProtocol { get }
}

public extension NetworkService where RequestBody == Void, ResponseModel: Decodable {
    
    func sendRequest() async throws -> ResponseModel {
       try await networkController.request(urlRequest: endPoint.getURLRequest())
    }
}
