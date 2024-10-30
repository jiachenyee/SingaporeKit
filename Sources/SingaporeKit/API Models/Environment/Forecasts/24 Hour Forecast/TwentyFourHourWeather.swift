//
//  TwentyFourHourWeather.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public struct TwentyFourHourWeather {
    
}

public extension TwentyFourHourWeather {
    struct GeneralForecast: Decodable, Sendable {
        public let validPeriod: ValidPeriod
        public let temperature: Value
        public let relativeHumidity: Value
        public let forecast: Forecast
        public let wind: Wind
    }
}

public extension TwentyFourHourWeather {
    struct Value: Decodable, Sendable {
        public let low: Double
        public let high: Double
        public let unit: String
    }
}

public extension TwentyFourHourWeather {
    struct Wind: Decodable, Sendable {
        public let speed: Speed
        public let direction: CompassPoint
    }
}

public extension TwentyFourHourWeather {
    struct Speed: Decodable, Sendable {
        public let low: Double
        public let high: Double
    }
}

public extension TwentyFourHourWeather {
    struct Period: Decodable, Sendable {
        public let timePeriod: ValidPeriod
        public let regions: Regions
    }
}

public extension TwentyFourHourWeather {
    struct Regions: Decodable, Sendable {
        public let west: Weather
        public let east: Weather
        public let central: Weather
        public let north: Weather
        public let south: Weather
        
        enum CodingKeys: CodingKey {
            case west
            case east
            case central
            case north
            case south
        }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<TwentyFourHourWeather.Regions.CodingKeys> = try decoder.container(keyedBy: TwentyFourHourWeather.Regions.CodingKeys.self)
            
            self.west = try container.decode(Forecast.self, forKey: .west).weather
            self.east = try container.decode(Forecast.self, forKey: .east).weather
            self.central = try container.decode(Forecast.self, forKey: .central).weather
            self.north = try container.decode(Forecast.self, forKey: .north).weather
            self.south = try container.decode(Forecast.self, forKey: .south).weather
        }
    }
    
    // Region Forecast
    struct Forecast: Decodable, Sendable {
        public let code: String
        public let weather: Weather
        
        enum CodingKeys: String, CodingKey {
            case code
            case weather = "text"
        }
    }
    
    enum CompassPoint: Decodable, Sendable {
        case north
        case northNorthEast
        case northEast
        case eastNorthEast
        case east
        case eastSouthEast
        case southEast
        case southSouthEast
        case south
        case southSouthWest
        case southWest
        case westSouthWest
        case west
        case variable
        
        case unknown(String)
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            let stringCode = try container.decode(String.self)
            
            switch stringCode {
            case "N": self = .north
            case "NNE": self = .northNorthEast
            case "NE": self = .northEast
            case "ENE": self = .eastNorthEast
            case "E": self = .east
            case "ESE": self = .eastSouthEast
            case "SE": self = .southEast
            case "SSE": self = .southSouthEast
            case "S": self = .south
            case "SSW": self = .southSouthWest
            case "SW": self = .southWest
            case "WSW": self = .westSouthWest
            case "W": self = .west
            case "VARIABLE": self = .variable
            default: self = .unknown(stringCode)
            }
        }
    }
}

extension TwentyFourHourWeather.CompassPoint: CustomStringConvertible {
    public var description: String {
        switch self {
        case .north: return "North"
        case .northNorthEast: return "North North East"
        case .northEast: return "North East"
        case .eastNorthEast: return "East North East"
        case .east: return "East"
        case .eastSouthEast: return "East South East"
        case .southEast: return "South East"
        case .southSouthEast: return "South South East"
        case .south: return "South"
        case .southSouthWest: return "South South West"
        case .southWest: return "South West"
        case .westSouthWest: return "West South West"
        case .west: return "West"
        case .variable: return "Variable"
        case .unknown(let value): return value
        }
    }
}
