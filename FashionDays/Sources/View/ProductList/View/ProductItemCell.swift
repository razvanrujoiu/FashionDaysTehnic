//
//  ProductItemCell.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import SwiftUI
import Kingfisher

struct ProductItemCell: View {
    
    var product: ProductPresentationModel
    var action: Action
    
    var body: some View {
        Button(action: action) {
            VStack {
                HStack {
                    KFImage.url(product.imagesListing.first)
                        .resizable()
                        .cacheMemoryOnly()
                        .frame(width: 80, height: 100)
                        .clipShape(.rect(cornerSize: CGSize(width: 12, height: 12)))
                        .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 0))
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(product.name)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        Spacer()
                        Text(product.brand)
                            .font(.system(size: 10))
                            .fontWeight(.regular)
                            .opacity(0.8)
                        Spacer()
                        Text("\(String(product.price)) Lei")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
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
