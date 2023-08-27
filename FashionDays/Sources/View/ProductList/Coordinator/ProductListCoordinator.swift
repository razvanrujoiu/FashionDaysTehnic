//
//  ProductListCoordinator.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 26.08.2023.
//

import SwiftUI

enum Page: Hashable, Identifiable {
    case productDetail(product: ProductPresentationModel)
    
    var id: String {
        String(describing: self)
    }
}

@Observable
class ProductListCoordinator {
    
    var navigationPath = NavigationPath()
    
    func push(page: Page) {
        navigationPath.append(page)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .productDetail(let product):
            ProductDetailCoordinatorView(product: product)
        }
    }
}

struct ProductListCoordinatorView: View {
    
    @State var coordinator = ProductListCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            ProductListView()
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }.environment(coordinator)
        .tint(.black)
    }
}
