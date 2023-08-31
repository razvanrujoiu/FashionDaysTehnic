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
    
    var presentedPage: Page?
    
    func push(page: Page) {
        navigationPath.append(page)
    }
    
    func present(page: Page) {
        presentedPage = page
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .productDetail(let product):
            ProductDetailCoordinatorView(product: product)
        }
    }
}

public struct ProductListCoordinatorView: View {
    
    @State var coordinator = ProductListCoordinator()
    
    public init() { }
    
    public var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            ProductListView()
                .sheet(item: $coordinator.presentedPage,
                       content: { page in
                    coordinator.build(page: page)
                })
                .fullScreenCover(item: $coordinator.presentedPage,
                                 content: { page in
                    coordinator.build(page: page)
                })
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
        }.environment(coordinator)
        .tint(.black)
    }
}
