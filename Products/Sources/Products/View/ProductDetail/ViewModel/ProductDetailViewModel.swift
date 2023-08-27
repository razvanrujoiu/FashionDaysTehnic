//
//  ProductDetailViewModel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
import SwiftUI

@Observable
class ProductDetailViewModel {
    
    var product: ProductPresentationModel
    
    init(product: ProductPresentationModel) {
        self.product = product
    }
}
