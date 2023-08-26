//
//  LoadingState.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation

enum LoadingState {
    case not_available
    case loading
    case success
    case failed(error: Error)
}
