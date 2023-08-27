//
//  LoadingState.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation

public enum LoadingState: Equatable {
    case not_available
    case loading
    case success
    case failed(error: Error)
    
    public static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.not_available, .not_available):
            return true
        case (.success, .success):
            return true
        case (.failed(error: let lhsType), .failed(error: let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        default:
            return false
        }
    }
}
