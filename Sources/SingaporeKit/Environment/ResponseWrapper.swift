//
//  ResponseWrapper.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

struct ResponseWrapper<RetrievedData: Decodable>: Decodable {
    let code: Int
    let errorMsg: String
    let data: RetrievedData?
}
