//
//  EventRow.swift
//  SinceThen
//
//  Created by Gangulwar on 5/14/25.
//
import SwiftUI

struct EventRow: View {
    let event: Event
    @State private var timeElapsed = ""
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(event.title)
                .font(.headline)
            
            Text(timeElapsed)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(formattedDate(event.date))
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
        .onReceive(timer) { _ in
            updateTimeElapsed()
        }
        .onAppear {
            updateTimeElapsed()
        }
    }
    
    private func updateTimeElapsed() {
        timeElapsed = timeElapsedString(since: event.date)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
