//
//  Reading.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public struct Reading: Codable, Identifiable, Hashable, Sendable {
    public var id: Date { timestamp }
    
    public let timestamp: Date
    public let data: [ReadingData]
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.timestamp = try Date.decode(from: container, forKey: .timestamp)
        self.data = try container.decode([ReadingData].self, forKey: .data)
    }
}
