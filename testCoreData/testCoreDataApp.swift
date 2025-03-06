//
//  testCoreDataApp.swift
//  testCoreData
//
//  Created by Brian Trzupek on 4/19/23.
//

import SwiftUI

@main
struct testCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
