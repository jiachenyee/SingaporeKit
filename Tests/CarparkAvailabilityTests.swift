//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Test func fetchCarparkAvailabilityDefault() async throws {
    let singapore = await SingaporeData()
    
    await singapore.fetchCarparkAvailability()
    
    switch await singapore.carparkAvailability {
    case .loading, .none: #expect(Bool(false), "Fetching carpark availability failed")
    case .failure(let error): #expect(Bool(false), "Fetching carpark availability failed with error: \(error)")
    case .success(let carparkAvailability):
        print(carparkAvailability.carparks)
        #expect(!carparkAvailability.carparks.isEmpty)
    }
}
