//
//  FourDayForecast+WeatherForecast.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public extension FourDayForecast {
    struct WeatherForecast: Decodable, Sendable {
        public let summary: String
        public let weather: Weather
        
        enum CodingKeys: String, CodingKey {
            case summary
            case weather = "text"
        }
    }
}
