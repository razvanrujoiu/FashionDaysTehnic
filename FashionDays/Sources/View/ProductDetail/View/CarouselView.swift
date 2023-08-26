//
//  Carousel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct CarouselView: View {
    
    var imageUrls: [URL]
    
    init(imageUrls: [URL]) {
        self.imageUrls = imageUrls
    }
    
    var body: some View {
        VStack {
            GeometryReader(content: { geometry in
                let size = geometry.size
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(imageUrls, id: \.self) { imageUrl in
                            GeometryReader(content: { proxy in
                                let cardSize = proxy.size
                                KFImage.url(imageUrl)
                                    .resizable()
                                    .cacheMemoryOnly()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: cardSize.width, height: cardSize.height, alignment: .center)
                                    .clipShape(.rect(cornerRadius: 12))
                            })
                            .frame(width: size.width, height: size.height)
                            .padding(.horizontal, 24)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.9)
                                }
                        }
                    }
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
            }).frame(height: 300)
        }
    }
}
