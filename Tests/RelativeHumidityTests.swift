//
//  RelativeHumidityTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Test func fetchRelativeHumidityDefault() async throws {
    let singapore = await SingaporeData()
    
    await singapore.fetchRelativeHumidity()
    
    switch await singapore.relativeHumidity {
    case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
    case .failure(let error): #expect(Bool(false), "Fetching relative humidity failed with error: \(error)")
    case .success(let rh):
        #expect(!rh.readings.isEmpty)
        #expect(!rh.stations.isEmpty)
    }
}

@Test func fetchRelativeHumidityNow() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .now
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

@Test func fetchRelativeHumidityToday() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .today
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

@Test func fetchRelativeHumidityYesterday() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .day(.now.addingTimeInterval(-86400))
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

@Test func fetchRelativeHumidityYesterdayMoment() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .moment(.now.addingTimeInterval(-86400))
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

@Test func fetchRelativeHumidityTomorrow() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .day(.now.addingTimeInterval(86400))
    }
    
    await singapore.fetchRelativeHumidity()
    
    switch await singapore.relativeHumidity {
    case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
    case .failure(let error):
        print(error)
        #expect(true)
    case .success: #expect(Bool(false), "Expected to receive no result")
    }
}

@Test func fetchRelativeHumidityTomorrowMoment() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .moment(.now.addingTimeInterval(86400))
    }
    
    await singapore.fetchRelativeHumidity()
    
    switch await singapore.relativeHumidity {
    case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
    case .failure(let error):
        print(error)
        #expect(true)
    case .success: #expect(Bool(false), "Expected to receive no result")
    }
}

@Test func fetchRelativeHumidityDistantPast() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .day(.distantPast)
    }
    
    await singapore.fetchRelativeHumidity()
    
    switch await singapore.relativeHumidity {
    case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
    case .failure(let error):
        print(error)
        #expect(true)
    case .success: #expect(Bool(false), "Expected to receive no result")
    }
}

@Test func fetchRelativeHumidityDistantPastMoment() async throws {
    let singapore = await SingaporeData()
    
    await MainActor.run {
        singapore.dateOption = .moment(.distantPast)
    }
    
    await singapore.fetchRelativeHumidity()
    
    switch await singapore.relativeHumidity {
    case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
    case .failure(let error):
        print(error)
        #expect(true)
    case .success: #expect(Bool(false), "Expected to receive no result")
    }
}
