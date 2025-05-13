//
//  EventStore.swift
//  SinceThen
//
//  Created by Gangulwar on 5/14/25.
//
import SwiftUI

class EventStore: ObservableObject {
    @Published var events: [Event] = [] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    func add(_ event: Event) {
        events.append(event)
    }
    
    func remove(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
    
    private func save() {
        if let encodedData = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(encodedData, forKey: "events")
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: "events"),
           let decodedEvents = try? JSONDecoder().decode([Event].self, from: data) {
            events = decodedEvents
        }
    }
}
