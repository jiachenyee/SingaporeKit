//
//  AirQuality.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public struct AirQuality: Decodable, Sendable, Identifiable {
    public let date: String
    
    public let lastUpdated: Date
    public let timestamp: Date
    
    public let readings: Readings
    
    public var id: Date {
        timestamp
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case lastUpdated = "updatedTimestamp"
        case timestamp
        case readings
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(String.self, forKey: .date)
        self.lastUpdated = try Date.decode(from: container, forKey: .lastUpdated)
        self.timestamp = try Date.decode(from: container, forKey: .timestamp)
        self.readings = try container.decode(AirQuality.Readings.self, forKey: .readings)
    }
}
