//
//  SingaporeData+UVI.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchUVIndex() async {
        uvIndex = .loading
        uvIndex = await fetchEnvironmentData(dataset: "uv")
    }
}
