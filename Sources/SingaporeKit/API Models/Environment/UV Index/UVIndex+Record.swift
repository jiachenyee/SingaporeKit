//
//  UVIndex+Record.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public extension UVIndex {
    struct Record: Decodable, Sendable, Identifiable {
        public var id: Date { date }
        
        public var date: Date
        public var value: Int
        
        enum CodingKeys: String, CodingKey {
            case date = "hour"
            case value = "value"
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: UVIndex.Record.CodingKeys.self)
            
            self.date = try Date.decode(from: container, forKey: .date)
            self.value = try container.decode(Int.self, forKey: UVIndex.Record.CodingKeys.value)
        }
    }
}
