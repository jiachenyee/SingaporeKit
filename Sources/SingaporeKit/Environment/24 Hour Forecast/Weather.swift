//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public enum Weather: Decodable, Sendable {
    case fair
    case fairDay
    case fairNight
    case fairAndWarm
    case partlyCloudy
    case partlyCloudyDay
    case partlyCloudyNight
    case cloudy
    case hazy
    case slightlyHazy
    case windy
    case mist
    case fog
    case lightRain
    case moderateRain
    case heavyRain
    case passingShowers
    case lightShowers
    case showers
    case heavyShowers
    case thunderyShowers
    case heavyThunderyShowers
    case heavyThunderyShowersWithGustyWinds
    
    case unknown(String)
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        
        switch stringValue {
        case "Fair": self = .fair
        case "Fair (Day)": self = .fairDay
        case "Fair (Night)": self = .fairNight
        case "Fair and Warm": self = .fairAndWarm
        case "Partly Cloudy": self = .partlyCloudy
        case "Partly Cloudy (Day)": self = .partlyCloudyDay
        case "Partly Cloudy (Night)": self = .partlyCloudyNight
        case "Cloudy": self = .cloudy
        case "Hazy": self = .hazy
        case "Slightly Hazy": self = .slightlyHazy
        case "Windy": self = .windy
        case "Mist": self = .mist
        case "Fog": self = .fog
        case "Light Rain": self = .lightRain
        case "Moderate Rain": self = .moderateRain
        case "Heavy Rain": self = .heavyRain
        case "Passing Showers": self = .passingShowers
        case "Light Showers": self = .lightShowers
        case "Showers": self = .showers
        case "Heavy Showers": self = .heavyShowers
        case "Thundery Showers": self = .thunderyShowers
        case "Heavy Thundery Showers": self = .heavyThunderyShowers
        case "Heavy Thundery Showers with Gusty Winds": self = .heavyThunderyShowersWithGustyWinds
        default: self = .unknown(stringValue)
        }
    }
    
    public init?(rawValue: String) {
        switch rawValue {
        case "Fair": self = .fair
        case "Fair (Day)": self = .fairDay
        case "Fair (Night)": self = .fairNight
        case "Fair and Warm": self = .fairAndWarm
        case "Partly Cloudy": self = .partlyCloudy
        case "Partly Cloudy (Day)": self = .partlyCloudyDay
        case "Partly Cloudy (Night)": self = .partlyCloudyNight
        case "Cloudy": self = .cloudy
        case "Hazy": self = .hazy
        case "Slightly Hazy": self = .slightlyHazy
        case "Windy": self = .windy
        case "Mist": self = .mist
        case "Fog": self = .fog
        case "Light Rain": self = .lightRain
        case "Moderate Rain": self = .moderateRain
        case "Heavy Rain": self = .heavyRain
        case "Passing Showers": self = .passingShowers
        case "Light Showers": self = .lightShowers
        case "Showers": self = .showers
        case "Heavy Showers": self = .heavyShowers
        case "Thundery Showers": self = .thunderyShowers
        case "Heavy Thundery Showers": self = .heavyThunderyShowers
        case "Heavy Thundery Showers with Gusty Winds": self = .heavyThunderyShowersWithGustyWinds
        default: self = .unknown(rawValue)
        }
    }
    
    public var systemImage: String {
        switch self {
        case .fair, .fairDay: return "sun.max"
        case .fairNight: return "moon.stars"
        case .fairAndWarm: return "thermometer.sun"
        case .partlyCloudy, .partlyCloudyDay: return "cloud.sun"
        case .partlyCloudyNight: return "cloud.moon"
        case .cloudy: return "cloud"
        case .hazy, .slightlyHazy: return "sun.haze"
        case .windy: return "wind"
        case .mist, .fog: return "cloud.fog"
        case .lightRain, .moderateRain, .heavyShowers: return "cloud.rain"
        case .heavyRain: return "cloud.heavyrain"
        case .passingShowers:
            return "cloud.heavyrain"
        case .lightShowers, .showers:
            return "cloud.sun.rain"
        case .thunderyShowers, .heavyThunderyShowers, .heavyThunderyShowersWithGustyWinds:
            return "cloud.bolt.rain"
        case .unknown:
            return "questionmark.circle"
        }
    }
}

extension Weather: CustomStringConvertible {
    public var description: String {
        switch self {
        case .fair: return "Fair"
        case .fairDay: return "Fair (Day)"
        case .fairNight: return "Fair (Night)"
        case .fairAndWarm: return "Fair and Warm"
        case .partlyCloudy: return "Partly Cloudy"
        case .partlyCloudyDay: return "Partly Cloudy (Day)"
        case .partlyCloudyNight: return "Partly Cloudy (Night)"
        case .cloudy: return "Cloudy"
        case .hazy: return "Hazy"
        case .slightlyHazy: return "Slightly Hazy"
        case .windy: return "Windy"
        case .mist: return "Mist"
        case .fog: return "Fog"
        case .lightRain: return "Light Rain"
        case .moderateRain: return "Moderate Rain"
        case .heavyRain: return "Heavy Rain"
        case .passingShowers: return "Passing Showers"
        case .lightShowers: return "Light Showers"
        case .showers: return "Showers"
        case .heavyShowers: return "Heavy Showers"
        case .thunderyShowers: return "Thundery Showers"
        case .heavyThunderyShowers: return "Heavy Thundery Showers"
        case .heavyThunderyShowersWithGustyWinds: return "Heavy Thundery Showers with Gusty Winds"
        case .unknown(let value):
            return value
        }
    }
}

extension Weather: CaseIterable {
    public static let allCases: [Weather] = [
        .fair,
        .fairDay,
        .fairNight,
        .fairAndWarm,
        .partlyCloudy,
        .partlyCloudyDay,
        .partlyCloudyNight,
        .cloudy,
        .hazy,
        .slightlyHazy,
        .windy,
        .mist,
        .fog,
        .lightRain,
        .moderateRain,
        .heavyRain,
        .passingShowers,
        .lightShowers,
        .showers,
        .heavyShowers,
        .thunderyShowers,
        .heavyThunderyShowers,
        .heavyThunderyShowersWithGustyWinds
    ]
}
