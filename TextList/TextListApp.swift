//
//  TextListApp.swift
//  TextList
//
//  Created by Alexander Rozhdestvenskiy on 20.10.2021.
//

import SwiftUI

@main
struct TextListApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
