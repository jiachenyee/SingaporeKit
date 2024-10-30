//
//  FourDayForecast.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public struct FourDayForecast: Decodable, Sendable, SingaporeDataValue {
    public typealias DataOption = DateOption
    
    public let date: String
    
    public let lastUpdated: Date
    public let timestamp: Date
    
    public var forecasts: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        case date
        case lastUpdated = "updatedTimestamp"
        case timestamp
        case forecasts
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.date = try container.decode(String.self, forKey: .date)
        self.lastUpdated = try Date.decode(from: container, forKey: .lastUpdated)
        self.timestamp = try Date.decode(from: container, forKey: .timestamp)
        self.forecasts = try container.decode([Forecast].self, forKey: .forecasts)
    }
}
