//
//  ApiEndpoint.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

typealias HTTPHeaders = [String: String]

public struct ApiEndpoint {
    var url: URL
    let headers: HTTPHeaders?
    let method: HTTPMethod
    
    init(url: URL, headers: HTTPHeaders?, method: HTTPMethod) {
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
