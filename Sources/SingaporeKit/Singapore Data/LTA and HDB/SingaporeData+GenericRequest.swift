//
//  SingaporeData+GenericRequest.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension SingaporeData {
    func sendGenericRequest<RetrievedData: Decodable>(date: String, endpoint: String) async throws(Error) -> RetrievedData {
        var url = URL(string: "https://api.data.gov.sg/v1/transport/\(endpoint)")!
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "date_time", value: date),
        ]
        
        url.append(queryItems: queryItems)
        
        do {
            let (data, status) = try await URLSession.shared.data(from: url)
            
            guard let status = status as? HTTPURLResponse else { throw Error.unexpectedServerResponse }
            
            if status.statusCode == 200 {
                let receivedResponse = try JSONDecoder().decode(RetrievedData.self,
                                                                from: data)
                
                return receivedResponse
            } else {
                let error = try JSONDecoder().decode(ErrorResponse.self,
                                                     from: data)
                
                if status.statusCode == 404 {
                    throw Error.notFound(error.message)
                } else {
                    throw Error.apiError(error.message)
                }
            }
        } catch {
            throw Error.from(error)
        }
    }
}
