//
//  ApiEndpoint.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public struct ApiEndpoint {
    public var url: URL
    public let headers: HTTPHeaders?
    public let method: HTTPMethod
    
    public init(url: URL, headers: HTTPHeaders?, method: HTTPMethod) {
        self.url = url
        self.headers = headers
        self.method = method
    }
    
    private func createURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
    
    public func getURLRequest() -> URLRequest {
        return createURLRequest()
    }
}
