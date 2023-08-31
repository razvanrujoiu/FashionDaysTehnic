//
//  Carousel.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import Foundation
import SwiftUI
import Kingfisher

public struct CarouselView: View {
    
    var imageUrls: [URL]
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    public init(imageUrls: [URL]) {
        self.imageUrls = imageUrls
    }
    
    public var body: some View {
        VStack {
            ZStack {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    KFImage.url(imageUrls[index])
                        .resizable()
                        .cacheMemoryOnly()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 275, height: 350)
                        .clipShape(.rect(bottomTrailingRadius: 66, topTrailingRadius: 66))
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index ? 1.0 : 0.9)
                        .offset(x: CGFloat(index - currentIndex) * 285 + dragOffset, y: 0)
                }
            }.gesture(
                DragGesture().onEnded({ value in
                    let treshhold: CGFloat = 50
                    if value.translation.width > treshhold {
                        withAnimation {
                            currentIndex = max(0, currentIndex - 1)
                        }
                    } else if value.translation.width < -treshhold {
                        withAnimation {
                            currentIndex = min(imageUrls.count - 1, currentIndex + 1)
                        }
                    }
                })
            )
        }
    }
}
