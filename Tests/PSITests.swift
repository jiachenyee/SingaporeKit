//
//  PSITests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("PSI", .tags(.environment))
struct PSITests {
    @Test("PSI Valid Configurations", arguments: [
        nil,
        DateOption.now,
        DateOption.today,
        DateOption.day(.now.addingTimeInterval(-86400)), // Yesterday
        DateOption.moment(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func psiValid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchPSI()
        
        switch await singapore.psi {
        case .loading, .none: #expect(Bool(false), "Fetching PSI failed")
        case .failure(let error): #expect(Bool(false), "Fetching PSI failed with error: \(error)")
        case .success(let at):
            #expect(!at.readings.isEmpty)
            #expect(!at.stations.isEmpty)
        }
    }
    
    @Test("PSI Invalid Configurations", arguments: [
        DateOption.day(.now.addingTimeInterval(86400)), // Tomorrow
        DateOption.moment(.now.addingTimeInterval(86400)), // Tomorrow Moment
        DateOption.day(.distantPast),
        DateOption.moment(.distantPast),
        DateOption.day(.distantFuture),
        DateOption.moment(.distantFuture)
    ])
    func psiInvalid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchPSI()
        
        switch await singapore.psi {
        case .loading, .none: #expect(Bool(false), "Fetching PSI failed")
        case .failure(let error):
            switch error {
            case .notFound: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }
}
