//
//  AddEventView.swift
//  SinceThen
//
//  Created by Gangulwar on 5/14/25.
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var eventStore: EventStore
    
    @State private var title = ""
    @State private var date = Date()
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Event Details") {
                    TextField("Title", text: $title)
                    DatePicker("Start Date", selection: $date, in: ...Date())
                }
            }
            .navigationTitle("New Event")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveEvent()
                    }
                    .disabled(title.isEmpty)
                }
            }
            .alert("Error", isPresented: $showError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    private func saveEvent() {
        if title.isEmpty {
            errorMessage = "Please enter a title for your event."
            showError = true
            return
        }
        
        if date > Date() {
            errorMessage = "Event date cannot be in the future."
            showError = true
            return
        }
        
        let newEvent = Event(title: title, date: date)
        eventStore.add(newEvent)
        dismiss()
    }
}
