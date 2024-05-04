//
//  KampusDestekAppApp.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//

import SwiftUI

@main
struct KampusDestekAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
