//
//  TwoHourForecast+AreaMetadata.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension TwoHourForecast {
    struct AreaMetadata: Decodable {
        let name: String
        let location: Location
        
        enum CodingKeys: String, CodingKey {
            case name
            case location = "label_location"
        }
    }
}
