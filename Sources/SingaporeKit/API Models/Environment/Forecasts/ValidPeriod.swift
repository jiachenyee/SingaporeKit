//
//  ValidPeriod.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public struct ValidPeriod: Decodable, CustomStringConvertible, Sendable {
    public let range: ClosedRange<Date>
    public let description: String
    
    public enum CodingKeys: String, CodingKey {
        case start
        case end
        case description = "text"
    }
    
    public init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        
        let startTimestamp = try container.decode(String.self, forKey: .start)
        let endTimestamp = try container.decode(String.self, forKey: .end)
        
        print(startTimestamp)
        print(endTimestamp)
        
        guard let startTimestamp = Date(iso8601Timestamp: startTimestamp),
              let endTimestamp = Date(iso8601Timestamp: endTimestamp) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.start, CodingKeys.end],
                                                    debugDescription: "Invalid ISO8601 date"))
        }
        
        range = min(startTimestamp, endTimestamp)...min(endTimestamp, startTimestamp)
        
        self.description = try container.decode(String.self, forKey: .description)
    }
}
