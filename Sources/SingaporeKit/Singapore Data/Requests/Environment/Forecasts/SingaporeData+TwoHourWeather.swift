//
//  SingaporeData+TwoHourWeather.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension SingaporeData {
    func fetch2hWeather() async {
        twoHourWeather = .loading
        
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var weatherResult: TwoHourForecast?
        
        do {
            repeat {
                let result: TwoHourForecast = try await sendEnvironmentRequest(date: date,
                                                                               withToken: token,
                                                                               endpoint: "two-hr-forecast")
                
                if weatherResult == nil {
                    weatherResult = result
                } else {
                    weatherResult?.forecasts.append(contentsOf: result.forecasts)
                }
                
                token = result.paginationToken
            } while token != nil
        } catch {
            twoHourWeather = .failure(error)
            return
        }
        
        if let weatherResult, !weatherResult.forecasts.isEmpty {
            twoHourWeather = .success(weatherResult.forecasts)
        } else {
            twoHourWeather = .failure(Error.notFound(nil))
        }
    }
}
