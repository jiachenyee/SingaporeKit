//
//  TwoHourForecast.swift
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
