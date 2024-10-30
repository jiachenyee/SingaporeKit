//
//  TwentyFourHourWeather+Record.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public extension TwentyFourHourWeather {
    struct Record: Decodable, SingaporeDataValue, Sendable, Identifiable {
        public typealias DataOption = DateOption
        
        public let date: Date
        public let lastUpdated: Date
        public let timestamp: Date
        public let general: GeneralForecast
        public let detailedForecasts: [Period]
        
        public var id: String { date.description + lastUpdated.description }
        
        public func detailedForecast(for date: Date = .now) -> Period? {
            let selectedPeriod = detailedForecasts.first { period in
                period.timePeriod.range.contains(date)
            }
            
            return selectedPeriod
        }
        
        enum CodingKeys: String, CodingKey {
            case date
            case lastUpdated = "updatedTimestamp"
            case timestamp
            case general
            case detailedForecasts = "periods"
        }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
            
            self.date = try Date.decode(from: container, forKey: .date)
            self.lastUpdated = try Date.decode(from: container, forKey: .lastUpdated)
            self.timestamp = try Date.decode(from: container, forKey: .timestamp)
            self.general = try container.decode(GeneralForecast.self, forKey: .general)
            self.detailedForecasts = try container.decode([Period].self, forKey: .detailedForecasts)
        }
    }
}

extension Array where Element == TwentyFourHourWeather.Record {
    public var current: TwentyFourHourWeather.Record? {
        return first {
            Calendar.singapore.isDateInToday($0.date)
        }
    }
}
