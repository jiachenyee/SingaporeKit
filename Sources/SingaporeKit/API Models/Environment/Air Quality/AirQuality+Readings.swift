//
//  AirQuality+Readings.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public extension AirQuality {
    struct Readings: Decodable, Sendable {
        let o3SubIndex: Reading
        let o3EightHourMax: Reading
        
        let pm10TwentyFourHourly: Reading
        let pm10SubIndex: Reading
        
        let no2OneHourMax: Reading
        
        let psiTwentyFourHourly: Reading
        
        let pm25TwentyFourHourly: Reading
        let pm25SubIndex: Reading
        
        let so2SubIndex: Reading
        let so2TwentyFourHourly: Reading
        
        let coEightHourMax: Reading
        let coSubIndex: Reading
        
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
