//
//  CoreNetworkingAPIMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
import FashionDays

func succcessHttpURLResponse(request: URLRequest) -> URLResponse {
    return HTTPURLResponse(url: request.url!,
                           statusCode: 200,
                           httpVersion: "HTTP/1.1", headerFields: nil)!
}

func unauthorizedHttpURLResponse(request: URLRequest) -> URLResponse {
    return HTTPURLResponse(url: request.url!,
                           statusCode: 401,
                           httpVersion: "HTTP/1.1", headerFields: nil)!
}

func notFoundHttpURLResponse(request: URLRequest) -> URLResponse {
    return HTTPURLResponse(url: request.url!,
                           statusCode: 404,
                           httpVersion: "HTTP/1.1", headerFields: nil)!
}

public class URLSessionMock {
    
    // Properties that enable us to set exactly what data and response
    // we want our mocked URLSession to return for any request.
    var data: Data?
    var response: URLResponse?
    
    init(data: Data? = nil, response: URLResponse? = nil) {
        self.data = data
        self.response = response
    }

    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        let data = loadJsonData(file: "ProductResponse")
        return (data!, response!)
    }
    
    private func loadJsonData(file: String) -> Data? {
        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
}

public class CoreNetworkingControllerMock: CoreNetworkingAPIProtocol {
    
    public func request<ResponseModel>(urlRequest: URLRequest) async throws -> ResponseModel where ResponseModel : Decodable {
        let data = try await URLSessionMock(response: succcessHttpURLResponse(request: urlRequest)).data(for: urlRequest)
        return try JSONDecoder().decode(ResponseModel.self, from: data.0)
    }
}
