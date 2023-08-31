//
//  ProductItemCell.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Common
import SwiftUI
import Kingfisher

struct ProductListItemCell: View {
    
    var product: ProductPresentationModel
    var action: Action
  
    var body: some View {
        Button(action: action) {
            VStack {
                HStack {
                    KFImage.url(product.imagesListing.first)
                        .resizable()
                        .cacheMemoryOnly()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 150)
                        .clipShape(.rect(cornerRadius: 12))
                        .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 0))
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer()
                        Text(product.name)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        Text(product.brand)
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .opacity(0.8)
                        ProductPriceView(price: product.price,
                                         originalPrice: product.originalPrice)
                        Spacer()
                    }
                    .padding(.all, 4)
                    Spacer()
                }
                .background(.white)
                .clipShape(.rect(cornerSize: CGSize(width: 12, height: 12)))
                .padding(.vertical, 4)
            }
        }
    }
}
