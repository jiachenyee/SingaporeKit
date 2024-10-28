//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension RelativeHumidity {
    struct RetrievedData: Codable, SingaporeDataValue, Sendable {
        typealias DataOption = DateOption
        
        var stations: Set<Station>
        var readings: Set<Reading>
        let readingType: String
        let readingUnit: String
        let paginationToken: String?
        
        func toRelativeHumidity() -> RelativeHumidity {
            RelativeHumidity(stations: Array(stations),
                             readings: Array(readings),
                             readingType: readingType,
                             readingUnit: readingUnit)
        }
        
        mutating func append(result: RetrievedData) {
            self.stations.formUnion(result.stations)
            self.readings.formUnion(result.readings)
        }
    }
}
