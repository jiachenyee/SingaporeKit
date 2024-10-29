//
//  RelativeHumidity+Reading.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public struct Reading: Codable, Identifiable, Hashable, Sendable {
    public var id: Date { timestamp }
    
    public let timestamp: Date
    public let data: [ReadingData]
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let isoTimestamp = try container.decode(String.self, forKey: .timestamp)
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: isoTimestamp) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.timestamp],
                                                    debugDescription: "Invalid ISO8601 date"))
        }
        
        self.timestamp = date
        self.data = try container.decode([ReadingData].self, forKey: .data)
    }
}

