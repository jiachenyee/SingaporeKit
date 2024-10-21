//
//  RelativeHumidity+Station.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public extension RelativeHumidity {
    struct Station: Codable, Identifiable, Hashable, Sendable {
        public let id: String
        public let deviceId: String
        public let name: String
        public let location: Location
    }
}
