//
//  UVIndex+RetrievedRecord.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

extension UVIndex {
    struct RetrievedRecord: Decodable {
        var index: [Record]
        
        var date: String
        
        var lastUpdated: Date
        
        var timestamp: Date
        
        enum CodingKeys: String, CodingKey {
            case index
            case date
            case lastUpdated = "updatedTimestamp"
            case timestamp
        }
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.index = try container.decode([Record].self, forKey: .index)
            self.date = try container.decode(String.self, forKey: .date)
            self.lastUpdated = try Date.decode(from: container, forKey: .lastUpdated)
            self.timestamp = try Date.decode(from: container, forKey: .timestamp)
        }
    }
}
