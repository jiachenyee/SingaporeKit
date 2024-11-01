//
//  SingaporeData+RelativeHumidity.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension SingaporeData {
    func fetchRelativeHumidity() async {
        await performRequest(for: dateOption,
                             refreshDuration: 60 * 5) {
            return await fetchEnvironmentData(dataset: "relative-humidity")
        } set: {
            relativeHumidity = $0
        }
    }
}
