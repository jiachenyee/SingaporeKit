//
//  TwentyFourHourWeather+Forecast.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension TwentyFourHourWeather {
    struct Forecast: Decodable, Sendable {
        public let code: String
        public let weather: Weather
        
        enum CodingKeys: String, CodingKey {
            case code
            case weather = "text"
        }
    }
}
