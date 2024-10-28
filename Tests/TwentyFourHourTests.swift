//
//  TwentyFourHourTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Test func fetchTwentyFourHourDefault() async throws {
    let singapore = await SingaporeData()
    
    await singapore.fetch24hWeather()
    
    switch await singapore.twentyFourHourWeather {
    case .loading, .none: #expect(Bool(false), "Fetching relative humidity failed")
    case .failure(let error): #expect(Bool(false), "Fetching relative humidity failed with error: \(error)")
    case .success(let weather):
        print(weather)
    }
}
