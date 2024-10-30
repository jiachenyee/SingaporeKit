//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public struct TwoHourForecast: Sendable, Decodable {
    public var forecasts: [Forecasts]
    let paginationToken: String?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let retrievedData = try container.decode(RetrievedData.self)
        
        forecasts = retrievedData.items.map {
            $0.toForecasts(areaMetadata: retrievedData.areaMetadata)
        }
        
        paginationToken = retrievedData.paginationToken
    }
}

public extension TwoHourForecast {
    struct Forecasts: Sendable, SingaporeDataValue {
        public typealias DataOption = DateOption
        
        public let lastUpdated: String
        public let timestamp: String
        public let validPeriod: ValidPeriod
        public let locations: [ForecastLocation]
    }
}

public extension TwoHourForecast {
    struct ForecastLocation: Sendable {
        public let area: String
        public let forecast: Weather
        public let location: Location?
    }
}

extension TwoHourForecast {
    struct RetrievedData: Decodable {
        let areaMetadata: [AreaMetadata]
        let items: [Item]
        let paginationToken: String?
        
        enum CodingKeys: String, CodingKey {
            case areaMetadata = "area_metadata"
            case items
            case paginationToken = "pagination_token"
        }
    }
    
    struct AreaMetadata: Decodable {
        let name: String
        let location: Location
        
        enum CodingKeys: String, CodingKey {
            case name
            case location = "label_location"
        }
    }
    
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
    
    struct Forecast: Decodable {
        let area: String
        let weather: Weather
        
        enum CodingKeys: String, CodingKey {
            case area
            case weather = "forecast"
        }
    }
}
