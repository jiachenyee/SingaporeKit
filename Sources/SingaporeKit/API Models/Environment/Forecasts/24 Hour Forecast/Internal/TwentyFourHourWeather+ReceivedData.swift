//
//  TwentyFourHourWeather+ReceivedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension TwentyFourHourWeather {
    struct RetrievedData: Decodable {
        var records: [Record]
        let paginationToken: String?
    }
}
