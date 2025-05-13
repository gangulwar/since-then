//
//  ContentView.swift
//  SinceThen
//
//  Created by Gangulwar on 5/13/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var showingAddEventSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(eventStore.events) { event in
                    EventRow(event: event)
                }
                .onDelete { indexSet in
                    eventStore.remove(at: indexSet)
                }
            }
            .navigationTitle("Since Then")
            .toolbar {
                Button {
                    showingAddEventSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddEventSheet) {
                AddEventView()
            }
        }
    }
}

#Preview {
    ContentView()
}
