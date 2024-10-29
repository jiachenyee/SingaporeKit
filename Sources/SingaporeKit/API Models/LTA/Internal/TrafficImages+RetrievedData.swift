//
//  TrafficImages+RetrievedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension TrafficImages {
    struct RetrievedData: Sendable, Decodable {
        var items: [TrafficImages]
    }
}
