//
//  TwentyFourHourWeather+Wind.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public struct Wind: Decodable, Sendable {
    public let low: Double
    public let high: Double
    
    public let direction: WindDirection
    
    enum CodingKeys: CodingKey {
        case speed
        case direction
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let speed = try container.decode(Speed.self, forKey: .speed)
        
        high = speed.high
        low = speed.low
        
        self.direction = try container.decode(WindDirection.self, forKey: .direction)
    }
}
