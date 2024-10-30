//
//  FourDayForecast+RetrievedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension FourDayForecast {
    struct RetrievedData: Decodable {
        let records: [FourDayForecast]
        let paginationToken: String?
    }
}
