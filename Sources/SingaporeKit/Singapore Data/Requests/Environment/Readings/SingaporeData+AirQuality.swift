//
//  SingaporeData+AirQuality.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchAirQuality() async {
        // AQ is updated hourly
        await performRequest(for: dateOption,
                             refreshDuration: 60*60) {
            return await sendAirQualityRequest()
        } set: {
            airQuality = $0
        }
    }
    
    func sendAirQualityRequest() async -> SingaporeDataResult<AirQuality.RetrievedData> {
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var aqResult: AirQuality.RetrievedData?
        
        do {
            repeat {
                let result: AirQuality.RetrievedData = try await sendEnvironmentRequest(date: date,
                                                                                        withToken: token,
                                                                                        endpoint: "psi")
                
                if aqResult == nil {
                    aqResult = result
                } else {
                    aqResult?.measurements.append(contentsOf: result.measurements)
                }
                
                token = result.paginationToken
            } while token != nil
        } catch {
            return .failure(error)
        }
        
        if let aqResult, !aqResult.measurements.isEmpty {
            return .success(aqResult)
        } else {
            return .failure(Error.notFound(nil))
        }
    }
}
