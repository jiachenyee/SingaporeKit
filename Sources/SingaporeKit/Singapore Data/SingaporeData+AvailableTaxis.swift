//
//  SingaporeData+AvailableTaxis.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchAvailableTaxis() async {
        availableTaxis = .loading
        
        let date = (momentOption ?? .now).date()
        
        do {
            let result = try await sendAvailableTaxisRequest(date: date)
            
            availableTaxis = .success(result)
        } catch {
            availableTaxis = .failure(error)
        }
    }
    
    fileprivate func sendAvailableTaxisRequest(date: String) async throws -> AvailableTaxis {
        var url = URL(string: "https://api.data.gov.sg/v1/transport/taxi-availability")!
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "date_time", value: date),
        ]
        
        url.append(queryItems: queryItems)
        
        let (data, status) = try await URLSession.shared.data(from: url)
        
        guard let status = status as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        let receivedResponse = try JSONDecoder().decode(AvailableTaxis.self,
                                                        from: data)
        
        return receivedResponse
    }
}
