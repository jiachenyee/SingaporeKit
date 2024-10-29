//
//  CarparkAvailability+CarparkLots.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public extension CarparkAvailability {
    struct CarparkLots: Sendable, Decodable {
        public let total: Int
        public let available: Int
        public let type: String
        
        public var percentAvailable: Double {
            Double(available) / Double(total)
        }
        
        enum CodingKeys: String, CodingKey {
            case total = "total_lots"
            case type = "lot_type"
            case available = "lots_available"
        }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
            
            guard let total = Int(try container.decode(String.self, forKey: CodingKeys.total)) else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.total, in: container, debugDescription: "Total Lots has to be an Integer")
            }
            
            guard let available = Int(try container.decode(String.self, forKey: CodingKeys.available)) else {
                throw DecodingError.dataCorruptedError(forKey: CodingKeys.available, in: container, debugDescription: "Lots Available has to be an Integer")
            }
            
            self.total = total
            self.available = available
            self.type = try container.decode(String.self, forKey: CodingKeys.type)
        }
    }
}
