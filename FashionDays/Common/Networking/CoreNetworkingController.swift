//
//  CoreNetworkingController.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation
import Foundation


protocol NetworkSession {
    
    func dataTask<ResponseModel>(with request: URLRequest) async throws -> ResponseModel where ResponseModel: Decodable
}

public protocol CoreNetworkingAPIProtocol: AnyObject {
    func request<ResponseModel>(urlRequest: URLRequest) async throws -> ResponseModel where ResponseModel: Decodable
}

public class CoreNetworkingController: CoreNetworkingAPIProtocol {
    
    public func request<ResponseModel>(urlRequest: URLRequest) async throws -> ResponseModel where ResponseModel : Decodable {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return try JSONDecoder().decode(ResponseModel.self, from: data)
    }
}
