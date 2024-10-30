//
//  TrafficImagesTests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation
import Testing
@testable import SingaporeKit

@Suite("Traffic Images", .tags(.lta))
struct TrafficImagesTests {
    @Test("Traffic Images Valid Configurations", arguments: [
        nil,
        MomentOption.now,
        MomentOption.at(.now.addingTimeInterval(-86400)) // Yesterday Moment
    ])
    func trafficImagesValid(momentOption: MomentOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.momentOption = momentOption
        }
        
        await singapore.fetchTrafficImages()
        
        switch await singapore.trafficImages {
        case .loading, .none: #expect(Bool(false), "Fetching traffic images failed")
        case .failure(let error): #expect(Bool(false), "Fetching traffic images failed with error: \(error)")
        case .success(let trafficImages): #expect(!trafficImages.cameras.isEmpty)
        }
    }
    
    @Test("Traffic Images Invalid Configurations", arguments: [
        MomentOption.at(.distantPast),
        MomentOption.at(.distantFuture)
    ])
    func trafficImagesInvalid(momentOption: MomentOption?) async throws {
        let singapore = await SingaporeData()
        
        await MainActor.run {
            singapore.momentOption = momentOption
        }
        
        await singapore.fetchTrafficImages()
        
        switch await singapore.trafficImages {
        case .loading, .none: #expect(Bool(false), "Fetching traffic images failed")
        case .failure(let error):
            switch error {
            case .apiError: #expect(true)
            default: #expect(Bool(false), "Unexpected error: \(error)")
            }
        case .success: #expect(Bool(false), "Expected to receive no result")
        }
    }
}
