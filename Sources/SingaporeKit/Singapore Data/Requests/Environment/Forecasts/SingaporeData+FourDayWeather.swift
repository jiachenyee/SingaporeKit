//
//  SingaporeData+FourDayWeather.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension SingaporeData {
    func fetch4dWeather() async {
        fourDayForecast = .loading
        
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var weatherResult: FourDayForecast?
        
        do {
            repeat {
                let result: FourDayForecast.RetrievedData = try await sendEnvironmentRequest(date: date,
                                                                                             withToken: token,
                                                                                             endpoint: "four-day-outlook")
                
                if weatherResult == nil {
                    weatherResult = result.records.first
                } else {
                    weatherResult?.forecasts.append(contentsOf: result.records.first?.forecasts ?? [])
                }
                
                token = result.paginationToken
            } while token != nil
        } catch {
            fourDayForecast = .failure(error)
            return
        }
        
        if let weatherResult, !weatherResult.forecasts.isEmpty {
            fourDayForecast = .success(weatherResult)
        } else {
            fourDayForecast = .failure(Error.notFound(nil))
        }
    }
}
