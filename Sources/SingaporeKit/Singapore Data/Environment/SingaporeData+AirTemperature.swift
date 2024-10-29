//
//  SingaporeData+AirTemperature.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchAirTemperature() async {
        airTemperature = .loading
        airTemperature = await fetchEnvironmentData(dataset: "air-temperature")
    }
}
