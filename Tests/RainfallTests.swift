//
//  RainfallTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("Rainfall", .tags(.environment))
struct RainfallTests {
    @Test("Rainfall Valid Configurations", arguments: [
        nil,
        DateOption.now,
        DateOption.today,
        DateOption.day(.now.addingTimeInterval(-86400)), // Yesterday
        DateOption.moment(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func rainfallValid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchRainfall()
        
        switch await singapore.rainfall {
        case .loading, .none: #expect(Bool(false), "Fetching rainfall failed")
        case .failure(let error): #expect(Bool(false), "Fetching rainfall failed with error: \(error)")
        case .success(let rf):
            #expect(!rf.readings.isEmpty)
            #expect(!rf.stations.isEmpty)
        }
    }
    
    @Test("Rainfall Invalid Configurations", arguments: [
        DateOption.day(.now.addingTimeInterval(86400)), // Tomorrow
        DateOption.moment(.now.addingTimeInterval(86400)), // Tomorrow Moment
        DateOption.day(.distantPast),
        DateOption.moment(.distantPast),
        DateOption.day(.distantFuture),
        DateOption.moment(.distantFuture)
    ])
    func rainfallInvalid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchRainfall()
        
        switch await singapore.rainfall {
        case .loading, .none: #expect(Bool(false), "Fetching rainfall failed")
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
