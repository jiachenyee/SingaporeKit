//
//  TrafficImages+Camera.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public extension TrafficImages {
    struct Camera: Sendable, Decodable {
        public var timestamp: Date
        public var image: URL
        public var location: Location
        public var cameraID: String
        public var metadata: ImageMetadata
        
        enum CodingKeys: String, CodingKey {
            case timestamp
            case image
            case location
            case cameraID = "camera_id"
            case metadata = "image_metadata"
        }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<TrafficImages.Camera.CodingKeys> = try decoder.container(keyedBy: TrafficImages.Camera.CodingKeys.self)
            
            self.timestamp = try Date.decode(from: container, forKey: .timestamp)
            self.image = try container.decode(URL.self, forKey: CodingKeys.image)
            self.location = try container.decode(Location.self, forKey: CodingKeys.location)
            self.cameraID = try container.decode(String.self, forKey: CodingKeys.cameraID)
            self.metadata = try container.decode(ImageMetadata.self, forKey: CodingKeys.metadata)
        }
    }
}
