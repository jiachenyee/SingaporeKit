//
//  CarparkAvailability+Carpark.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public extension CarparkAvailability {
    struct Carpark: Sendable, Decodable, Identifiable {
        public let number: String
        public let lots: [CarparkLots]
        public let lastUpdated: Date
        
        enum CodingKeys: String, CodingKey {
            case number = "carpark_number"
            case lots = "carpark_info"
            case lastUpdated = "update_datetime"
        }
        
        public var id: String { number }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<CarparkAvailability.Carpark.CodingKeys> = try decoder.container(keyedBy: CarparkAvailability.Carpark.CodingKeys.self)
            self.number = try container.decode(String.self, forKey: CarparkAvailability.Carpark.CodingKeys.number)
            self.lots = try container.decode([CarparkAvailability.CarparkLots].self, forKey: CarparkAvailability.Carpark.CodingKeys.lots)
            
            let lastUpdatedString = try container.decode(String.self, forKey: CarparkAvailability.Carpark.CodingKeys.lastUpdated) + "+08:00"
            
            guard let lastUpdated = Date(iso8601Timestamp: lastUpdatedString) else {
                throw DecodingError.dataCorruptedError(forKey: .lastUpdated, in: container, debugDescription: "Failed to decode last updated timestamp")
            }
            
            self.lastUpdated = lastUpdated
        }
    }
}