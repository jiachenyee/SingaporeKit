//
//  TwoHourForecast+Forecasts.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public extension TwoHourForecast {
    struct Forecasts: Sendable, SingaporeDataValue, Identifiable {
        public typealias DataOption = DateOption
        
        public let lastUpdated: Date
        public let timestamp: Date
        public let validPeriod: ValidPeriod
        public let locations: [ForecastLocation]
        
        public var id: Date {
            return timestamp
        }
    }
}

extension Array where Element == TwoHourForecast.Forecasts {
    public var current: Element {
        return first {
            Calendar.singapore.isDateInToday($0.timestamp)
        }!
    }
}
