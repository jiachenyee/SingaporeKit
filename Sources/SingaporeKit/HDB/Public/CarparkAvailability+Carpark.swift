//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public extension CarparkAvailability {
    struct Carpark: Sendable, Decodable, Identifiable {
        public let number: String
        public let lots: [CarparkLots]
        public let lastUpdated: String // ISO
        
        enum CodingKeys: String, CodingKey {
            case number = "carpark_number"
            case lots = "carpark_info"
            case lastUpdated = "update_datetime"
        }
        
        public var id: String { number }
    }
}
