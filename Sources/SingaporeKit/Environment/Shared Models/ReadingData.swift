//
//  ReadingData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public struct ReadingData: Codable, Hashable, Sendable {
    public let stationId: String
    public let value: Double
}
