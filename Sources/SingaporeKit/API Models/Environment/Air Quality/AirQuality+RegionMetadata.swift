//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

extension AirQuality {
    struct RegionMetadata: Decodable {
        var name: String
        var labelLocation: Location
    }
}
