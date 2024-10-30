//
//  AirTemeratureTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("Air Temperature Tests", .tags(.environment))
struct AirTemeratureTests {
    @Test("Air Temperature Valid Configurations", arguments: [
        nil,
        DateOption.now,
        DateOption.today,
        DateOption.day(.now.addingTimeInterval(-86400)), // Yesterday
        DateOption.moment(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func airTemperatureValid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchAirTemperature()
        
        switch await singapore.airTemperature {
        case .loading, .none: #expect(Bool(false), "Fetching air temperature failed")
        case .failure(let error): #expect(Bool(false), "Fetching air temperature failed with error: \(error)")
        case .success(let at):
            #expect(!at.readings.isEmpty)
            #expect(!at.stations.isEmpty)
        }
    }
    
    @Test("Air Temperature Invalid Configurations", arguments: [
        DateOption.day(.now.addingTimeInterval(86400)), // Tomorrow
        DateOption.moment(.now.addingTimeInterval(86400)), // Tomorrow Moment
        DateOption.day(.distantPast),
        DateOption.moment(.distantPast),
        DateOption.day(.distantFuture),
        DateOption.moment(.distantFuture)
    ])
    func airTemperatureInvalid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchAirTemperature()
        
        switch await singapore.airTemperature {
        case .loading, .none: #expect(Bool(false), "Fetching air temperature failed")
        case .failure(let error):
            switch error {
            case .notFound: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }
}
