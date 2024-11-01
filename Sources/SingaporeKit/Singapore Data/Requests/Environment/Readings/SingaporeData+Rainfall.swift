//
//  SingaporeData+Rainfall.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchRainfall() async {
        await performRequest(for: dateOption,
                             refreshDuration: 60 * 5) {
            return await fetchEnvironmentData(dataset: "rainfall")
        } set: {
            rainfall = $0
        }
    }
}
