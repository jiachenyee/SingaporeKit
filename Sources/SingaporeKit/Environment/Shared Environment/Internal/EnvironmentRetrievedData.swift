//
//  EnvironmentRetrievedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

struct EnvironmentRetrievedData: Codable, SingaporeDataValue, Sendable {
    typealias DataOption = DateOption
    
    var stations: Set<Station>
    var readings: Set<Reading>
    let readingType: String
    let readingUnit: String
    let paginationToken: String?
    
    func toEnvironmentData() -> EnvironmentData {
        EnvironmentData(stations: Array(stations),
                        readings: Array(readings),
                        readingType: readingType,
                        readingUnit: readingUnit)
    }
    
    mutating func append(result: Self) {
        self.stations.formUnion(result.stations)
        self.readings.formUnion(result.readings)
    }
}
