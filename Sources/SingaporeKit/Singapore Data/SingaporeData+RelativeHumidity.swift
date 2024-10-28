//
//  SingaporeData+RelativeHumidity.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension SingaporeData {
    func fetchRelativeHumidity() async {
        relativeHumidity = .loading
        
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var relativeHumidityResult: RelativeHumidity.RetrievedData?
        
        do {
            repeat {
                let result = try await sendRelativeHumidityRequest(date: date,
                                                                   withToken: token)
                
                if relativeHumidityResult == nil {
                    relativeHumidityResult = result
                } else {
                    relativeHumidityResult?.append(result: result)
                }
                
                token = result.paginationToken
            } while token != nil
        } catch {
            relativeHumidity = .failure(error)
            return
        }
        
        if let relativeHumidity = relativeHumidityResult?.toRelativeHumidity() {
            self.relativeHumidity = .success(relativeHumidity)
        } else {
            self.relativeHumidity = .failure(DataError.dataNotFound)
        }
    }
    
    fileprivate func sendRelativeHumidityRequest(date: String,
                                                 withToken paginationToken: String?) async throws -> RelativeHumidity.RetrievedData {
        var url = URL(string: "https://api-open.data.gov.sg/v2/real-time/api/relative-humidity")!
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "date", value: date),
        ]
        
        if let paginationToken {
            queryItems.append(URLQueryItem(name: "paginationToken",
                                           value: paginationToken))
        }
        
        url.append(queryItems: queryItems)
        
        let (response, status) = try await URLSession.shared.data(from: url)
        
        guard let status = status as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        let receivedResponse = try JSONDecoder().decode(ResponseWrapper<RelativeHumidity.RetrievedData>.self,
                                                        from: response)
        
        if let data = receivedResponse.data {
            return data
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
