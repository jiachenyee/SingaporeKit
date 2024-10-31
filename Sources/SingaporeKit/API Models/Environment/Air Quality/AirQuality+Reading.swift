//
//  AirQuality+Reading.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

extension AirQuality {
    struct Reading: Decodable, Sendable {
        let north: Int
        let south: Int
        let east: Int
        let west: Int
        let central: Int
    }
}
