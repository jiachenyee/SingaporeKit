//
//  AirQuality+Regions.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public extension AirQuality {
    struct Regions: Sendable {
        public let north: Location
        public let south: Location
        public let east: Location
        public let west: Location
        public let central: Location
        
        init?(from metadata: [RegionMetadata]) {
            var north: Location?
            var south: Location?
            var east: Location?
            var west: Location?
            var central: Location?
            
            for data in metadata {
                switch data.name {
                case "north": north = data.labelLocation
                case "south": south = data.labelLocation
                case "east": east = data.labelLocation
                case "west": west = data.labelLocation
                case "central": central = data.labelLocation
                default: break
                }
            }
            
            guard let north = north, let south = south, let east = east, let west = west, let central = central else {
                return nil
            }
            
            self.north = north
            self.south = south
            self.east = east
            self.west = west
            self.central = central
        }
    }
}
