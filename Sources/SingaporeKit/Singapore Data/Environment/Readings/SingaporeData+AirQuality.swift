//
//  SingaporeData+AirQuality.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchAirQuality() async {
        airQuality = .loading
        
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
            airQuality = .failure(error)
            return
        }
        
        if let aqResult, !aqResult.measurements.isEmpty {
            airQuality = .success(aqResult)
        } else {
            airQuality = .failure(Error.notFound(nil))
        }
    }
}
