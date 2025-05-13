//
//  Event.swift
//  SinceThen
//
//  Created by Gangulwar on 5/13/25.
//

import Foundation

struct Event: Identifiable, Codable {
    var id = UUID()
    var title: String
    var date: Date
    
    init(id: UUID = UUID(), title: String, date: Date) {
        self.id = id
        self.title = title
        self.date = date
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case date
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.date = try container.decode(Date.self, forKey: .date)
    }

    static var example: Event {
        Event(title: "Started Learning SwiftUI", date: Date().addingTimeInterval(-86400 * 3))
    }
}
