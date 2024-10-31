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
    
    func performRequest<Value>(for dateOption: DateOption?,
                               refreshDuration: TimeInterval,
                               request: (() async -> SingaporeDataResult<Value>), set: (SingaporeDataResult<Value>) -> Void) async {
        set(.loading)
        
        set(await request())
        
        switch dateOption {
        case .realTime(let interval):
            while true {
                do {
                    try await Task.sleep(for: .seconds(interval ?? refreshDuration))
                } catch {
                    return
                }
                let tempValue = await request()
                
                if tempValue.isSuccess {
                    set(tempValue)
                }
            }
        default: break
        }
    }
}
