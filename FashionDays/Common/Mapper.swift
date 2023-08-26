//
//  Mapper.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import Foundation

public protocol Mapper {
    
    associatedtype In
    associatedtype Out
    
    func map(_ value: In) -> Out
}
