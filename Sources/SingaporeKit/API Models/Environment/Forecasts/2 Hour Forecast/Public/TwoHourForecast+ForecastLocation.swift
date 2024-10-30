//
//  TwoHourForecast+ForecastLocation.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public extension TwoHourForecast {
    struct ForecastLocation: Sendable {
        public let area: String
        public let forecast: Weather
        public let location: Location?
    }
}
