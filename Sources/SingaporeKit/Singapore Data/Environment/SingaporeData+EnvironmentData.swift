//
//  SingaporeData+EnvironmentData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchEnvironmentData(dataset: String) async -> SingaporeDataResult<EnvironmentData> {
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var result: EnvironmentRetrievedData?
        
        do {
            repeat {
                let currentPageResult = try await sendEnvironmentDataRequest(date: date,
                                                                             withToken: token,
                                                                             dataset: "air-temperature")
                
                if result == nil {
                    result = currentPageResult
                } else {
                    result?.append(result: currentPageResult)
                }
                
                token = currentPageResult.paginationToken
            } while token != nil
        } catch {
            return .failure(error)
        }
        
        if let value = result?.toEnvironmentData() {
            return .success(value)
        } else {
            return .failure(DataError.dataNotFound)
        }
    }
    
    func sendEnvironmentDataRequest(date: String,
                                    withToken paginationToken: String?,
                                    dataset: String) async throws -> EnvironmentRetrievedData {
        var url = URL(string: "https://api-open.data.gov.sg/v2/real-time/api/\(dataset)")!
        
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
        
        let receivedResponse = try JSONDecoder().decode(ResponseWrapper<EnvironmentRetrievedData>.self,
                                                        from: response)
        
        if let data = receivedResponse.data {
            return data
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
