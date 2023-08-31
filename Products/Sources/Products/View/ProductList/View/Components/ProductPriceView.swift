//
//  ProductPriceView.swift
//
//
//  Created by Razvan Rujoiu on 31.08.2023.
//

import SwiftUI

struct ProductPriceView: View {
    
    var price: Double
    var originalPrice: Double
    var isDiscounted: Bool {
        price != originalPrice
    }
    
    var body: some View {
        HStack(spacing: 4) {
            if isDiscounted {
                Text("\(String(originalPrice)) Lei")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .strikethrough(color: .black.opacity(0.3))
                    .foregroundStyle(.black.opacity(0.5))
            }
            Text("\(String(price)) Lei")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundStyle(isDiscounted ? .red : .black)
        }
    }
}
