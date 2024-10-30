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
        
        self.timestamp = try Date.decode(from: container, forKey: .timestamp)
        self.cameras = try container.decode([TrafficImages.Camera].self, forKey: .cameras)
    }
}
