//
//  ValidPeriod.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public struct ValidPeriod: Decodable, CustomStringConvertible, Sendable, Hashable {
    public let range: ClosedRange<Date>
    public let description: String
    
    public enum CodingKeys: String, CodingKey {
        case start
        case end
        case description = "text"
    }
    
    public init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        
        let startTimestamp = try Date.decode(from: container, forKey: .start)
        let endTimestamp = try Date.decode(from: container, forKey: .end)
        
        range = min(startTimestamp, endTimestamp)...min(endTimestamp, startTimestamp)
        
        self.description = try container.decode(String.self, forKey: .description)
    }
}
