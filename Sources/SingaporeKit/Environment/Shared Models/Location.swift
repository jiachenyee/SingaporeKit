//
//  Location.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation
import CoreLocation

public struct Location: Codable, Hashable, Sendable {
    public let latitude: Double
    public let longitude: Double
    
    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
