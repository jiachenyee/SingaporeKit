//
//  UVIndexTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("UV Index", .tags(.environment))
struct UVIndexTests {
    @Test("UV Index Valid Configurations", arguments: [
        nil,
        DateOption.now,
        DateOption.today,
        DateOption.day(.now.addingTimeInterval(-86400)), // Yesterday
        DateOption.moment(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func uviValid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchUVIndex()
        
        switch await singapore.uvIndex {
        case .loading, .none: #expect(Bool(false), "Fetching UV index failed")
        case .failure(let error): #expect(Bool(false), "Fetching UV index failed with error: \(error)")
        case .success(let uvi):
            #expect(!uvi.records.isEmpty)
        }
    }
    
    @Test("UV Index Invalid Configurations", arguments: [
        DateOption.day(.now.addingTimeInterval(86400)), // Tomorrow
        DateOption.moment(.now.addingTimeInterval(86400)), // Tomorrow Moment
        DateOption.day(.distantPast),
        DateOption.moment(.distantPast),
        DateOption.day(.distantFuture),
        DateOption.moment(.distantFuture)
    ])
    func uviInvalid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetchUVIndex()
        
        switch await singapore.uvIndex {
        case .loading, .none: #expect(Bool(false), "Fetching UV index failed")
        case .failure(let error):
            switch error {
            case .notFound: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }
}
