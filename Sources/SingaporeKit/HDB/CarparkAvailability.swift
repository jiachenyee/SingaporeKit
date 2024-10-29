//
//  CarparkAvailability.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public struct CarparkAvailability: Sendable, Decodable, SingaporeDataValue {
    public typealias DataOption = DateOption
    
    public var timestamp: String
    public var carparks: [Carpark]
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case carparks = "carpark_data"
    }
}
