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
            let result: CarparkAvailability.RetrievedData = try await sendGenericRequest(date: date, endpoint: "carpark-availability")
            
            if let carparkAvailability = result.items.first {
                self.carparkAvailability = .success(carparkAvailability)
            } else {
                self.carparkAvailability = .failure(Error.notFound(nil))
            }
        } catch {
            carparkAvailability = .failure(error)
        }
    }
}
