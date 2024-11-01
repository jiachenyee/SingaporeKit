//
//  SingaporeData+AirTemperature.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchAirTemperature() async {
        await performRequest(for: dateOption,
                             refreshDuration: 60) {
            return await fetchEnvironmentData(dataset: "air-temperature")
        } set: {
            airTemperature = $0
        }
    }
}
