//
//  AirQuality+Readings.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public extension AirQuality {
    struct Readings: Decodable, Sendable {
        public let o3SubIndex: Reading
        public let o3EightHourMax: Reading
        
        public let pm10TwentyFourHourly: Reading
        public let pm10SubIndex: Reading
        
        public let no2OneHourMax: Reading
        
        public let psiTwentyFourHourly: Reading
        
        public let pm25TwentyFourHourly: Reading
        public let pm25SubIndex: Reading
        
        public let so2SubIndex: Reading
        public let so2TwentyFourHourly: Reading
        
        public let coEightHourMax: Reading
        public let coSubIndex: Reading
        
        enum CodingKeys: String, CodingKey {
            case o3SubIndex = "o3_sub_index"
            case o3EightHourMax = "o3_eight_hour_max"
            case pm10TwentyFourHourly = "pm10_twenty_four_hourly"
            case pm10SubIndex = "pm10_sub_index"
            case no2OneHourMax = "no2_one_hour_max"
            case psiTwentyFourHourly = "psi_twenty_four_hourly"
            case pm25TwentyFourHourly = "pm25_twenty_four_hourly"
            case pm25SubIndex = "pm25_sub_index"
            case so2SubIndex = "so2_sub_index"
            case so2TwentyFourHourly = "so2_twenty_four_hourly"
            case coEightHourMax = "co_eight_hour_max"
            case coSubIndex = "co_sub_index"
        }
    }
}
