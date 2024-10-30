//
//  Value.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public struct Value: Decodable, Sendable {
    public let low: Double
    public let high: Double
    public let unit: String
}
