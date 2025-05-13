//
//  SinceThenApp.swift
//  SinceThen
//
//  Created by Gangulwar on 5/13/25.
//

import SwiftUI

@main
struct SinceThenApp: App {
    
    @StateObject private var eventStore = EventStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(eventStore)
        }
    }
}
