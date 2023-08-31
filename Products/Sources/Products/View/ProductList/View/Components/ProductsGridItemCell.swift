//
//  ProductsGridItemCell.swift
//
//
//  Created by Razvan Rujoiu on 30.08.2023.
//

import Common
import SwiftUI
import Kingfisher

struct ProductsGridItemCell: View {
    
    var product: ProductPresentationModel
    var action: Action
    
    var body: some View {
        Button(action: action) {
            VStack {
                Spacer()
                KFImage.url(product.imagesListing.first)
                    .resizable()
                    .cacheMemoryOnly()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 180)
                    .clipShape(.rect(bottomTrailingRadius: 36, topTrailingRadius: 36))
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 0))
                Spacer()
                VStack(spacing: 4) {
                    HStack {
                        Spacer()
                        Text(product.name)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    
                    Text(product.brand)
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .opacity(0.8)
                    
                    ProductPriceView(price: product.price,
                                     originalPrice: product.originalPrice)
                }
                Spacer()
            }.background(.white)
            .clipShape(.rect(cornerSize: CGSize(width: 12, height: 12)))
        }
    }
}
