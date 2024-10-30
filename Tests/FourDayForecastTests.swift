//
//  FourDayForecastTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("4 Day Weather", .tags(.environment))
struct FourDayForecastTests {
    @Test("4d Weather Valid Configurations", arguments: [
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
        
        await singapore.fetch4dWeather()
        
        switch await singapore.fourDayForecast {
        case .loading, .none: #expect(Bool(false), "Fetching weather failed")
        case .failure(let error): #expect(Bool(false), "Fetching weather failed with error: \(error.debugDescription)")
        case .success(let weather):
            #expect(!weather.forecasts.isEmpty)
        }
    }
    
    @Test("4d Weather Invalid Configurations", arguments: [
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
        
        await singapore.fetch4dWeather()
        
        switch await singapore.fourDayForecast {
        case .loading, .none: #expect(Bool(false), "Fetching 4d weather failed")
        case .failure(let error):
            switch error {
            case .notFound: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }
}
