//
//  ProductsLocalService.swift
//
//
//  Created by Razvan Rujoiu on 30.08.2023.
//

import Foundation
import SwiftData
import OSLog
import SwiftUI

class ProductLocalService {
    
    var container: ModelContainer?

    init() {
        self.container = try? ModelContainer(for: ProductLocalDataModel.self)
    }
    
    /// We need to adnotate this function with `MainActor` to be sure it is running on
    /// UI thread, since the `MainContext` is bound to the `MainActor`
    @MainActor
    func getLocalProducts() throws -> [ProductLocalDataModel] {
        let descriptor = FetchDescriptor<ProductLocalDataModel>()
        guard let container = container else { return [] }
        let localProducts = try container.mainContext.fetch(descriptor)
        return localProducts
    }
    
    @MainActor
    func insertProducts(products: [ProductLocalDataModel]) {
        for localProduct in products {
            insertProduct(product: localProduct)
        }
    }
    
    @MainActor
    private func insertProduct(product: ProductLocalDataModel) {
        guard let container = container else { return }
        container.mainContext.insert(product)
        do {
            try container.mainContext.save()
        } catch {
            Logger.viewCycle.error("\(error.localizedDescription)")
        }
    }
    
}
