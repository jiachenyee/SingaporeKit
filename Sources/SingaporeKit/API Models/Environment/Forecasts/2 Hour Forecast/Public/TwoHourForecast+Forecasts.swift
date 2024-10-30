//
//  TwoHourForecast+Forecasts.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public extension TwoHourForecast {
    struct Forecasts: Sendable, SingaporeDataValue {
        public typealias DataOption = DateOption
        
        public let lastUpdated: String
        public let timestamp: String
        public let validPeriod: ValidPeriod
        public let locations: [ForecastLocation]
    }
}
