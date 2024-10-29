//
//  TrafficImages+ImageMetadata.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public extension TrafficImages {
    struct ImageMetadata: Sendable, Decodable {
        public var height: Int
        public var width: Int
        public var md5: String
    }
}
