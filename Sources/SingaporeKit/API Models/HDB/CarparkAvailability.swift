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
        
        self.timestamp = try Date.decode(from: container, forKey: .timestamp)
        self.carparks = try container.decode([CarparkAvailability.Carpark].self, forKey: .carparks)
    }
}
