//
//  SingaporeData+TwentyFourHourWeather.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension SingaporeData {
    func fetch24hWeather() async {
        twentyFourHourWeather = .loading
        
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var weatherResult: [TwentyFourHourWeather.Record] = []
        
        do {
            repeat {
                let result: TwentyFourHourWeather.RetrievedData = try await sendEnvironmentRequest(date: date,
                                                                                                   withToken: token,
                                                                                                   endpoint: "twenty-four-hr-forecast")
                
                weatherResult.append(contentsOf: result.records)
                
                token = result.paginationToken
            } while token != nil
        } catch {
            twentyFourHourWeather = .failure(error)
            return
        }
        
        if !weatherResult.isEmpty {
            twentyFourHourWeather = .success(weatherResult)
        } else {
            twentyFourHourWeather = .failure(Error.notFound(nil))
        }
    }
}
