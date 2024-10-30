//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public extension FourDayForecast {
    struct Forecast: Decodable, Sendable {
        public let temperature: Value
        public let relativeHumidity: Value
        public let weather: WeatherForecast
        public let wind: Wind
        
        public let day: String
        public let date: Date
        
        enum CodingKeys: String, CodingKey {
            case temperature
            case relativeHumidity
            case weather = "forecast"
            case day
            case date = "timestamp"
            case wind
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.temperature = try container.decode(Value.self, forKey: CodingKeys.temperature)
            self.relativeHumidity = try container.decode(Value.self, forKey: CodingKeys.relativeHumidity)
            self.weather = try container.decode(WeatherForecast.self, forKey: CodingKeys.weather)
            self.day = try container.decode(String.self, forKey: CodingKeys.day)
            self.date = try Date.decode(from: container, forKey: .date)
            self.wind = try container.decode(Wind.self, forKey: CodingKeys.wind)
        }
    }
}
