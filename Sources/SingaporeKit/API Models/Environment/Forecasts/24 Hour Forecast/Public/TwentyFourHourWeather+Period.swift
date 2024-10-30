//
//  TwentyFourHourWeather+Period.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public extension TwentyFourHourWeather {
    struct Period: Decodable, Sendable {
        public let timePeriod: ValidPeriod
        
        public let west: Weather
        public let east: Weather
        public let central: Weather
        public let north: Weather
        public let south: Weather
        
        enum CodingKeys: CodingKey {
            case timePeriod
            case regions
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.timePeriod = try container.decode(ValidPeriod.self, forKey: CodingKeys.timePeriod)
            
            let regions = try container.decode(TwentyFourHourWeather.Regions.self, forKey: CodingKeys.regions)
            
            west = regions.west
            east = regions.east
            central = regions.central
            north = regions.north
            south = regions.south
        }
    }
}
