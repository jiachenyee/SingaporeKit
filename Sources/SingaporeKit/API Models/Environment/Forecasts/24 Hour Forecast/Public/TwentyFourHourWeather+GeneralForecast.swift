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
        public let forecast: Forecast
        public let wind: Wind
    }
}
