//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchRainfall() async {
        rainfall = .loading
        rainfall = await fetchEnvironmentData(dataset: "rainfall")
    }
}
