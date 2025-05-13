//
//  Helper.swift
//  SinceThen
//
//  Created by Gangulwar on 5/14/25.
//

import Foundation

func timeElapsedString(since date: Date) -> String {
    let calendar = Calendar.current
    let now = Date()
    let components = calendar.dateComponents([.day, .hour, .minute, .second], from: date, to: now)
    
    let days = components.day ?? 0
    let hours = components.hour ?? 0
    let minutes = components.minute ?? 0
    let seconds = components.second ?? 0
    
    return "\(days)d \(hours)h \(minutes)m \(seconds)s ago"
}
