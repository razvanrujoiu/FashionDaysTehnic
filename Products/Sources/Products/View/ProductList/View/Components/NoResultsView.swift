//
//  NoResultsView.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 27.08.2023.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        HStack {
//            LottieView(lottieFile: "no_results_animation").frame(width: 44, height: 44)
            Text("No results found")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundStyle(.black.opacity(0.7))
        }
    }
}

#Preview {
    NoResultsView()
}
