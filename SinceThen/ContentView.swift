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
            Group {
                if eventStore.events.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "calendar.badge.exclamationmark")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        Text("No events added yet.")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Tap + to add your first event.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(eventStore.events) { event in
                            EventRow(event: event)
                        }
                        .onDelete { indexSet in
                            eventStore.remove(at: indexSet)
                        }
                    }
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
