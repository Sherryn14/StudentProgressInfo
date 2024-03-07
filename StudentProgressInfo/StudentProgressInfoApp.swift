//
//  StudentProgressInfoApp.swift
//  StudentProgressInfo
//
//  Created by admin on 8/3/2024.
//

import SwiftUI

@main
struct StudentProgressInfoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
