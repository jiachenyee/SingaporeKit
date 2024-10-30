//
//  TwentyFourHourWeather+GeneralForecast.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public extension TwentyFourHourWeather {
    struct GeneralForecast: Decodable, Sendable {
        public let validPeriod: ValidPeriod
        public let temperature: Value
        public let relativeHumidity: Value
        public let weather: Weather
        public let wind: Wind
        
        enum CodingKeys: String, CodingKey {
            case validPeriod
            case temperature
            case relativeHumidity
            case forecast
            case wind
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.validPeriod = try container.decode(ValidPeriod.self, forKey: .validPeriod)
            self.temperature = try container.decode(Value.self, forKey: .temperature)
            self.relativeHumidity = try container.decode(Value.self, forKey: .relativeHumidity)
            self.weather = try container.decode(Forecast.self, forKey: .forecast).weather
            self.wind = try container.decode(Wind.self, forKey: .wind)
        }
    }
}
