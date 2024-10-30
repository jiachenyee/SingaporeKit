//
//  TwentyFourHourWeather+Regions.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension TwentyFourHourWeather {
    struct Regions: Decodable, Sendable {
        let west: Weather
        let east: Weather
        let central: Weather
        let north: Weather
        let south: Weather
        
        enum CodingKeys: CodingKey {
            case west
            case east
            case central
            case north
            case south
        }
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.west = try container.decode(Forecast.self, forKey: .west).weather
            self.east = try container.decode(Forecast.self, forKey: .east).weather
            self.central = try container.decode(Forecast.self, forKey: .central).weather
            self.north = try container.decode(Forecast.self, forKey: .north).weather
            self.south = try container.decode(Forecast.self, forKey: .south).weather
        }
    }
}
