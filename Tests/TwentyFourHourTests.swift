//
//  TwentyFourHourTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("24h Weather", .tags(.environment))
struct TwentyFourHourTests {
    @Test("24h Weather Valid Configurations", arguments: [
        nil,
        DateOption.now,
        DateOption.today,
        DateOption.day(.now.addingTimeInterval(-86400)), // Yesterday
        DateOption.moment(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func twentyFourHourValid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetch24hWeather()
        
        switch await singapore.twentyFourHourWeather {
        case .loading, .none: #expect(Bool(false), "Fetching weather failed")
        case .failure(let error): #expect(Bool(false), "Fetching weather failed with error: \(error)")
        case .success(let weather):
            #expect(!weather.isEmpty)
        }
    }
    
    @Test("24h Weather Invalid Configurations", arguments: [
        DateOption.day(.now.addingTimeInterval(86400)), // Tomorrow
        DateOption.moment(.now.addingTimeInterval(86400)), // Tomorrow Moment
        DateOption.day(.distantPast),
        DateOption.moment(.distantPast),
        DateOption.day(.distantFuture),
        DateOption.moment(.distantFuture)
    ])
    func twentyFourHourInvalid(dateOption: DateOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.dateOption = dateOption
        }
        
        await singapore.fetch24hWeather()
        
        switch await singapore.twentyFourHourWeather {
        case .loading, .none: #expect(Bool(false), "Fetching 24h weather failed")
        case .failure(let error):
            switch error {
            case .notFound: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }
}
