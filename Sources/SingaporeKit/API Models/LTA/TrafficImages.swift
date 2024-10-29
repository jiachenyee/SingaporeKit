//
//  TrafficImages.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public struct TrafficImages: Sendable, SingaporeDataValue, Decodable {
    public typealias DataOption = MomentOption
    
    public var timestamp: Date
    public var cameras: [Camera]
    
    enum CodingKeys: CodingKey {
        case timestamp
        case cameras
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let timestampString = try container.decode(String.self, forKey: .timestamp)
        
        guard let timestamp = Date(iso8601Timestamp: timestampString) else {
            throw DecodingError.dataCorruptedError(forKey: .timestamp, in: container, debugDescription: "Invalid timestamp: \(timestampString)")
        }
        
        self.timestamp = timestamp
        self.cameras = try container.decode([TrafficImages.Camera].self, forKey: .cameras)
    }
}
