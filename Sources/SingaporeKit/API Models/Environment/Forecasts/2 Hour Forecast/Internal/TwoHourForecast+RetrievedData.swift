//
//  TwoHourForecast+RetrievedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension TwoHourForecast {
    struct RetrievedData: Decodable {
        let areaMetadata: [AreaMetadata]
        let items: [Item]
        let paginationToken: String?
        
        enum CodingKeys: String, CodingKey {
            case areaMetadata = "area_metadata"
            case items
            case paginationToken = "pagination_token"
        }
    }
}
