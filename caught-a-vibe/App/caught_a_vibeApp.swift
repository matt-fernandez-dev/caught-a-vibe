//
//  caught_a_vibeApp.swift
//  caught-a-vibe
//
//  Created by Matthew Fernandez on 3/13/23.
//

import SwiftUI
import Firebase


@main
struct caught_a_vibeApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FirebaseManager.shared)
        }
    }
}
