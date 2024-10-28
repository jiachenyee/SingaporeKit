//
//  SingaporeData+TwentyFourHourWeather.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension SingaporeData {
    enum DataError: Error {
        case dataNotFound
    }
}

extension SingaporeData {
    func fetch24hWeather() async {
        twentyFourHourWeather = .loading
        
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var weatherResult: [TwentyFourHourWeather.Record] = []
        
        do {
            repeat {
                let result = try await send24hWeatherRequest(date: date,
                                                             withToken: token)
                
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
            twentyFourHourWeather = .failure(DataError.dataNotFound)
        }
    }
    
    fileprivate func send24hWeatherRequest(date: String,
                                           withToken paginationToken: String?) async throws -> TwentyFourHourWeather.RetrievedData {
        var url = URL(string: "https://api-open.data.gov.sg/v2/real-time/api/twenty-four-hr-forecast")!
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "date", value: date),
        ]
        
        if let paginationToken {
            queryItems.append(URLQueryItem(name: "paginationToken",
                                           value: paginationToken))
        }
        
        url.append(queryItems: queryItems)
        
        let (data, status) = try await URLSession.shared.data(from: url)
        
        guard let status = status as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        let receivedResponse = try JSONDecoder().decode(ResponseWrapper<TwentyFourHourWeather.RetrievedData>.self,
                                                        from: data)
        
        if let data = receivedResponse.data {
            return data
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
