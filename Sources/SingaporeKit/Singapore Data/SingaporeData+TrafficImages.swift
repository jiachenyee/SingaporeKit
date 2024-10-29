//
//  SingaporeData+TrafficImages.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchTrafficImages() async {
        trafficImages = .loading
        
        let date = (momentOption ?? .now).date()
        
        do {
            let result = try await sendTrafficImaegsRequest(date: date)
            
            if let trafficImages = result.items.first {
                self.trafficImages = .success(trafficImages)
            } else {
                self.trafficImages = .failure(DataError.dataNotFound)
            }
        } catch {
            trafficImages = .failure(error)
        }
    }
    
    fileprivate func sendTrafficImaegsRequest(date: String) async throws -> TrafficImages.RetrievedData {
        var url = URL(string: "https://api.data.gov.sg/v1/transport/traffic-images")!
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "date_time", value: date),
        ]
        
        url.append(queryItems: queryItems)
        
        let (data, status) = try await URLSession.shared.data(from: url)
        
        guard let status = status as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        let receivedResponse = try JSONDecoder().decode(TrafficImages.RetrievedData.self,
                                                        from: data)
        
        return receivedResponse
    }
}
