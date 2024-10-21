//
//  RelativeHumidity+ResponseWrapper.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension RelativeHumidity {
    struct ResponseWrapper: Codable {
        let code: Int
        let errorMsg: String
        let data: RetrievedData?
    }
}
