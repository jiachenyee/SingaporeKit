//
//  AirQuality+RetrievedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public extension AirQuality {
    struct RetrievedData: Decodable, SingaporeDataValue, Sendable {
        public typealias DataOption = DateOption
        
        public var measurements: [AirQuality]
        public var regionLocations: Regions
        var paginationToken: String?
        
        enum CodingKeys: String, CodingKey {
            case measurements = "items"
            case regionMetadata
            case paginationToken
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.measurements = try container.decode([AirQuality].self, forKey: .measurements)
            
            let regionMetadata = try container.decode([RegionMetadata].self, forKey: .regionMetadata)
            
            guard let regions = Regions(from: regionMetadata) else {
                throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.regionMetadata],
                                                        debugDescription: "Invalid region metadata"))
            }
            self.regionLocations = regions
            
            self.paginationToken = try container.decodeIfPresent(String.self, forKey: .paginationToken)
        }
        
        public var latestMeasurement: AirQuality {
            measurements.max(by: { $0.timestamp < $1.timestamp })!
        }
    }
}
