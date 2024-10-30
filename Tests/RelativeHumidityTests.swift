//
//  RelativeHumidityTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("Relative Humidity", .tags(.environment))
struct RelativeHumidityTests {
    @Test("Relative Humidity Valid Configurations", arguments: [
        nil,
        DateOption.now,
        DateOption.today,
        DateOption.day(.now.addingTimeInterval(-86400)), // Yesterday
        DateOption.moment(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func relativeHumidityValid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchRelativeHumidity()
        
        switch await singapore.relativeHumidity {
        case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
        case .failure(let error): #expect(Bool(false), "Fetching relative humidity failed with error: \(error)")
        case .success(let rh):
            #expect(!rh.readings.isEmpty)
            #expect(!rh.stations.isEmpty)
        }
    }
    
    @Test("Relative Humidity Invalid Configurations", arguments: [
        DateOption.day(.now.addingTimeInterval(86400)), // Tomorrow
        DateOption.moment(.now.addingTimeInterval(86400)), // Tomorrow Moment
        DateOption.day(.distantPast),
        DateOption.moment(.distantPast),
        DateOption.day(.distantFuture),
        DateOption.moment(.distantFuture)
    ])
    func relativeHumidityInvalid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchRelativeHumidity()
        
        switch await singapore.relativeHumidity {
        case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
        case .failure(let error):
            switch error {
            case .notFound: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
            #expect(true)
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }
}
