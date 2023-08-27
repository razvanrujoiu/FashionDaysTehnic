//
//  FashionDaysApp.swift
//  FashionDays
//
//  Created by Razvan Rujoiu on 25.08.2023.
//

import SwiftUI
import SwiftData
import Products

@main
struct FashionDaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [ProductLocalDataModel.self])
    }
}
