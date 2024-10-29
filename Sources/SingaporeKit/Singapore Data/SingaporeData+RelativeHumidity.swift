//
//  SingaporeData+RelativeHumidity.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension SingaporeData {
    func fetchRelativeHumidity() async {
        relativeHumidity = .loading
        relativeHumidity = await fetchEnvironmentData(dataset: "relative-humidity")
    }
}
