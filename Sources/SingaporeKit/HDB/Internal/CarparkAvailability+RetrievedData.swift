//
//  CarparkAvailability+RetrievedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension CarparkAvailability {
    struct RetrievedData: Decodable {
        var items: [CarparkAvailability]
    }
}
