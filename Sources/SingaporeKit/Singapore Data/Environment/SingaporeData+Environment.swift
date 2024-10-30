//
//  SingaporeData+Environment.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension SingaporeData {
    func sendEnvironmentRequest<RetrievedData: Decodable>(date: String,
                                                          withToken paginationToken: String?,
                                                          endpoint: String) async throws -> RetrievedData {
        var url = URL(string: "https://api-open.data.gov.sg/v2/real-time/api/\(endpoint)")!
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "date", value: date),
        ]
        
        if let paginationToken {
            queryItems.append(URLQueryItem(name: "paginationToken",
                                           value: paginationToken))
        }
        
        url.append(queryItems: queryItems)
        
        let (data, status) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = status as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        let receivedResponse = try JSONDecoder().decode(ResponseWrapper<RetrievedData>.self,
                                                        from: data)
        
        switch httpResponse.statusCode {
        case 200:
            if let data = receivedResponse.data {
                return data
            } else {
                throw Error.dataNotFound
            }
        case 404: throw Error.notFound(receivedResponse.errorMsg)
        default: throw Error.apiError(receivedResponse.errorMsg)
        }
    }
}
