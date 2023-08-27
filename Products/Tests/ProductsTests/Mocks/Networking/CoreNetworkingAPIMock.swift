//
//  CoreNetworkingAPIMock.swift
//  FashionDaysTests
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import Foundation
import Common

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

enum MockJsons: String {
    case productResponse = "ProductResponse.json"

    var url: URL {
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        return thisDirectory.appendingPathComponent("\(self.rawValue)")
    }

    func getData() throws -> Data {
        return try Data(contentsOf: self.url)
    }
}

public class URLSessionMock {
    
    /// Properties that enable us to set exactly what data and response
    /// we want our mocked URLSession to return for any request.
    var data: Data?
    var response: URLResponse?
    
    init(data: Data? = nil, response: URLResponse? = nil) {
        self.data = data
        self.response = response
    }

    /// The `URLSessionMock` should have extended `URLSession` and override the `data` function
    /// but `data` function isn't an open function like `dataTask` so i have created a function with the same
    /// definition for now
    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        let data = try MockJsons.productResponse.getData()
        return (data, response!)
    }
}

public class CoreNetworkingControllerMock: CoreNetworkingAPIProtocol {
    
    public func request<ResponseModel>(urlRequest: URLRequest) async throws -> ResponseModel where ResponseModel : Decodable {
        let data = try await URLSessionMock(response: succcessHttpURLResponse(request: urlRequest)).data(for: urlRequest)
        return try JSONDecoder().decode(ResponseModel.self, from: data.0)
    }
}
