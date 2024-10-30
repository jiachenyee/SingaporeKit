//
//  TwoHourForecast+Item.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension TwoHourForecast {
    struct Item: Decodable {
        let lastUpdated: Date
        let timestamp: Date
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
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.lastUpdated = try Date.decode(from: container, forKey: .lastUpdated)
            self.timestamp = try Date.decode(from: container, forKey: .timestamp)
            self.validPeriod = try container.decode(ValidPeriod.self, forKey: .validPeriod)
            self.forecasts = try container.decode([TwoHourForecast.Forecast].self, forKey: .forecasts)
        }
    }
}
