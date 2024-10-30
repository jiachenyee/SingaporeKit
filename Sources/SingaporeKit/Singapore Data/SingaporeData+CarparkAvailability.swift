//
//  SingaporeData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchCarparkAvailability() async {
        carparkAvailability = .loading
        
        let date = (momentOption ?? .now).date()
        
        do {
            let result = try await sendCarparkAvailabilityRequest(date: date)
            
            if let carparkAvailability = result.items.first {
                self.carparkAvailability = .success(carparkAvailability)
            } else {
                self.carparkAvailability = .failure(Error.notFound(nil))
            }
        } catch {
            carparkAvailability = .failure(error)
        }
    }
    
    fileprivate func sendCarparkAvailabilityRequest(date: String) async throws(Error) -> CarparkAvailability.RetrievedData {
        var url = URL(string: "https://api.data.gov.sg/v1/transport/carpark-availability")!
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "date_time", value: date),
        ]
        
        url.append(queryItems: queryItems)
        
        do {
            let (data, status) = try await URLSession.shared.data(from: url)
            
            guard let status = status as? HTTPURLResponse else { throw Error.unexpectedServerResponse }
            
            let receivedResponse = try JSONDecoder().decode(CarparkAvailability.RetrievedData.self,
                                                            from: data)
            
            return receivedResponse
        } catch {
            throw Error.from(error)
        }
    }
}
