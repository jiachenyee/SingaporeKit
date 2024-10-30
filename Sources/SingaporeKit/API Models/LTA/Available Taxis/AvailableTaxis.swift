//
//  AvailableTaxis.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public struct AvailableTaxis: Decodable, Sendable, SingaporeDataValue {
    public typealias DataOption = MomentOption
    
    public var timestamp: Date
    public var taxiCount: Int
    public var locations: [Location]

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let retrievedData = try container.decode(RetrievedData.self)
        
        guard let feature = retrievedData.features.first else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No feature found in the retrieved data.")
            throw DecodingError.dataCorrupted(context)
        }
        
        locations = feature.geometry.coordinates.map {
            Location(latitude: $0[1], longitude: $0[0])
        }
        
        taxiCount = feature.properties.taxiCount
        
        guard let timestamp = Date(iso8601Timestamp: feature.properties.timestamp) else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Invalid timestamp format.")
        }
        
        self.timestamp = timestamp
    }
}

extension AvailableTaxis {
    struct RetrievedData: Decodable {
        var features: [Feature]
    }
    
    struct Feature: Decodable {
        var geometry: Geometry
        var properties: Properties
    }
    
    struct Geometry: Decodable {
        var coordinates: [[Double]]
    }
    
    struct Properties: Decodable {
        var timestamp: String
        var taxiCount: Int
        
        enum CodingKeys: String, CodingKey {
            case timestamp = "timestamp"
            case taxiCount = "taxi_count"
        }
    }
}
