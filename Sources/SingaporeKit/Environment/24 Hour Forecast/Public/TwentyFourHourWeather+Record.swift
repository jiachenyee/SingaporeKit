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
            let container: KeyedDecodingContainer<TwentyFourHourWeather.Record.CodingKeys> = try decoder.container(keyedBy: TwentyFourHourWeather.Record.CodingKeys.self)
            
            let dateString = try container.decode(String.self, forKey: .date)
            let fullDateString = dateString + "T00:00:00+08:00"
            
            guard let date = Date(iso8601Timestamp: fullDateString) else {
                throw DecodingError.dataCorruptedError(forKey: .date,
                                                       in: container,
                                                       debugDescription: "Failed to decode updated timestamp")
            }
            
            self.date = date
            
            let lastUpdatedDateString = try container.decode(String.self, forKey: .lastUpdated)
            
            guard let lastUpdated = Date(iso8601Timestamp: lastUpdatedDateString) else {
                throw DecodingError.dataCorruptedError(forKey: .lastUpdated, in: container, debugDescription: "Failed to decode updated timestamp")
            }
            
            self.lastUpdated = lastUpdated
            
            let timestamp = try container.decode(String.self, forKey: .timestamp)
            
            guard let timestampDate = Date(iso8601Timestamp: timestamp) else {
                throw DecodingError.dataCorruptedError(forKey: .date,
                                                       in: container,
                                                       debugDescription: "Failed to decode updated timestamp")
            }
            
            self.timestamp = timestampDate
            
            self.general = try container.decode(GeneralForecast.self, forKey: .general)
            self.detailedForecasts = try container.decode([Period].self, forKey: .detailedForecasts)
        }
    }
}

extension Array where Element == TwentyFourHourWeather.Record {
    public var current: TwentyFourHourWeather.Record? {
        print(map {
            $0.date
        })
        return first {
            Calendar.singapore.isDateInToday($0.date)
        }
    }
}
