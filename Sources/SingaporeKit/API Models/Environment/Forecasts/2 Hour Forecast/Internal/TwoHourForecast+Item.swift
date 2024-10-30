//
//  TwoHourForecast+Item.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension TwoHourForecast {
    struct Item: Decodable {
        let lastUpdated: String
        let timestamp: String
        let validPeriod: ValidPeriod
        let forecasts: [Forecast]
        
        enum CodingKeys: String, CodingKey {
            case lastUpdated = "update_timestamp"
            case timestamp
            case validPeriod = "valid_period"
            case forecasts
        }
        
        func toForecasts(areaMetadata: [AreaMetadata]) -> Forecasts {
            Forecasts(lastUpdated: lastUpdated,
                      timestamp: timestamp,
                      validPeriod: validPeriod,
                      locations: forecasts.map({ forecast in
                
                let areaMetadata = areaMetadata.first { metadata in
                    metadata.name == forecast.area
                }
                
                return ForecastLocation(area: forecast.area,
                                        forecast: forecast.weather,
                                        location: areaMetadata?.location)
            }))
        }
    }
}
