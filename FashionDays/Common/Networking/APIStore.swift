//
//  APIStore.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public class APIStore<APIProtocol> {
    
    public typealias APIImplementationFactory = () -> APIProtocol
    
    private var apiImplementationFactory: APIImplementationFactory?
    private var noOpImplementation: APIProtocol?
    
    public init() { }
    
    public init(singleton: APIProtocol) {
        apiImplementationFactory = { singleton }
    }
    
    public init(noOPImplementation: APIProtocol) {
        self.noOpImplementation = noOPImplementation
    }
    
    public var implementationFactory: APIImplementationFactory {
        get { 
            guard let factory = apiImplementationFactory else {
                print("Factory for \(String(describing: APIProtocol.self)) not available")
                guard let noOpImplementation = noOpImplementation else {
                    print("Implementation for \(String(describing: APIProtocol.self)) not available")
                    fatalError("Implementation for \(String(describing: APIProtocol.self)) not available")
                }
                return { noOpImplementation }
            }
            return factory
        }
        set { apiImplementationFactory = newValue }
    }
    
    public var implementation: APIProtocol {
        implementationFactory()
    }
}
