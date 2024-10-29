//
//  CarparkAvailability.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public struct CarparkAvailability: Sendable, Decodable, SingaporeDataValue {
    public typealias DataOption = MomentOption
    
    public var timestamp: Date
    public var carparks: [Carpark]
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case carparks = "carpark_data"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let timestampString = try container.decode(String.self, forKey: .timestamp)
        
        guard let timestamp = Date(iso8601Timestamp: timestampString) else {
            throw DecodingError.dataCorruptedError(forKey: .timestamp, in: container, debugDescription: "Failed to decode timestamp")
        }
        
        self.timestamp = timestamp
        self.carparks = try container.decode([CarparkAvailability.Carpark].self, forKey: .carparks)
    }
}
