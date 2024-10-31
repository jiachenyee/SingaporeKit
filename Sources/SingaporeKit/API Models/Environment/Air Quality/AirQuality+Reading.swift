//
//  AirQuality+Reading.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public extension AirQuality {
    struct Reading: Decodable, Sendable {
        public let north: Int
        public let south: Int
        public let east: Int
        public let west: Int
        public let central: Int
    }
}
