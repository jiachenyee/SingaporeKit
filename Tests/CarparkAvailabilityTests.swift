//
//  CarparkAvailabilityTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("Carpark Availability", .tags(.hdb))
struct CarparkAvailabilityTests {
    @Test("Carpark Availability Valid Configurations", arguments: [
        nil,
        MomentOption.now,
        MomentOption.at(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func carparkAvailabilityValid(momentOption: MomentOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.momentOption = momentOption
        }
        
        await singapore.fetchCarparkAvailability()
        
        switch await singapore.carparkAvailability {
        case .loading, .none: #expect(Bool(false), "Fetching carpark availability failed")
        case .failure(let error): #expect(Bool(false), "Fetching carpark availability failed with error: \(error)")
        case .success(let carparkAvailability):
            #expect(!carparkAvailability.carparks.isEmpty)
        }
    }
    
    @Test("Carpark Availability Invalid Configurations", arguments: [
        MomentOption.at(.distantPast),
        MomentOption.at(.distantFuture),
        MomentOption.at(.now.addingTimeInterval(86400)) // tomorrow,
    ])
    func carparkAvailabilityInvalid(momentOption: MomentOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.momentOption = momentOption
        }
        
        await singapore.fetchCarparkAvailability()
        
        switch await singapore.carparkAvailability {
        case .loading, .none: #expect(Bool(false), "Fetching carpark availability failed")
        case .failure(let error):
            switch error {
            case .notFound: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }

}
