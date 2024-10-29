//
//  AvailableTaxiTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Test("Available Taxis Valid Configurations", arguments: [
    nil,
    MomentOption.now,
    MomentOption.at(.now.addingTimeInterval(-86400)) // Yesterday Moment
])
func availableTaxisValid(option: MomentOption?) async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.momentOption = option
    }
    
    await singapore.fetchAvailableTaxis()
    
    switch await singapore.availableTaxis {
    case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
    case .failure(let error): #expect(Bool(false), "Fetching relative humidity failed with error: \(error)")
    case .success(let taxi):
        #expect(!taxi.locations.isEmpty)
        #expect(taxi.locations.count == taxi.taxiCount)
    }
}

@Test("Available Taxis Invalid Configurations", arguments: [
    MomentOption.at(.distantPast),
    MomentOption.at(.distantFuture)
])
func availableTaxisInvalid(option: MomentOption?) async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.momentOption = option
    }
    
    await singapore.fetchAvailableTaxis()
    
    switch await singapore.availableTaxis {
    case .loading, .none: #expect(Bool(false), "Fetching 24h weather failed")
    case .failure(let error):
        print(error)
        #expect(true)
    case .success: #expect(Bool(false), "Expected to receive no result")
    }
}
