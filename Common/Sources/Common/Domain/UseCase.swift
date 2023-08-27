//
//  UseCase.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public protocol UseCase {
    associatedtype In
    associatedtype Out
    
    func execute(_ parameters: In) async throws -> Out
}
