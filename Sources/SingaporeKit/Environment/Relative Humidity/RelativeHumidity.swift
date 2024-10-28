//
//  RelativeHumidity.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public struct RelativeHumidity: SingaporeDataValue, Sendable {
    public typealias DataOption = DateOption
    
    public let stations: [Station]
    public let readings: [Reading]
    public let readingType: String
    public let readingUnit: String
    
    public func latestReading(for station: Station) -> Double? {
        
        let sortedReadings = readings.sorted(by: { $0.timestamp > $1.timestamp })
        
        for reading in sortedReadings {
            guard let value = reading.data.first(where: { $0.stationId == station.id })?.value else { continue }
            
            return value
        }
        return nil
    }
}
