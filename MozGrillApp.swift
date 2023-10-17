//
//  MozGrillApp.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

@main
struct MozGrillApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
