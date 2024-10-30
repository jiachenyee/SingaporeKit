//
//  TwoHourForecast+Forecast.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension TwoHourForecast {
    struct Forecast: Decodable {
        let area: String
        let weather: Weather
        
        enum CodingKeys: String, CodingKey {
            case area
            case weather = "forecast"
        }
    }
}
