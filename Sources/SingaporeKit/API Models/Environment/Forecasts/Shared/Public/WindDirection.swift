//
//  WindDirection.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

public enum WindDirection: Decodable, Sendable {
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

extension WindDirection: CustomStringConvertible {
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
