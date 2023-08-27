//
//  ProductsErrorView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import SwiftUI

struct ProductsErrorView: View {
    
    var errorMessage: String
    var action: Action
    
    var body: some View {
        VStack(spacing: 8) {
            Text(errorMessage)
                .font(.system(size: 16))
                .fontWeight(.semibold)
            Button {
                self.action()
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Retry")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundStyle(.blue.opacity(0.7))
                }
            }
        }
    }
}

#Preview {
    ProductsErrorView(errorMessage: "Error") {
        
    }
}
