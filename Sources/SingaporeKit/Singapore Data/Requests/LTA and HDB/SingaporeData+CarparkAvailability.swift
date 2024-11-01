//
//  SingaporeData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchCarparkAvailability() async {
        let date = (momentOption ?? .now).date()
        
        await performRequest(for: momentOption, refreshDuration: 60) {
            await sendCarparkAvailabilityRequest()
        } set: { result in
            carparkAvailability = result
        }
    }
    
    func sendCarparkAvailabilityRequest() async -> SingaporeDataResult<CarparkAvailability> {
        let date = (momentOption ?? .now).date()
        
        do {
            let result: CarparkAvailability.RetrievedData = try await sendGenericRequest(date: date, endpoint: "carpark-availability")
            
            if let carparkAvailability = result.items.first {
                return .success(carparkAvailability)
            } else {
                return .failure(Error.notFound(nil))
            }
        } catch {
            return .failure(error)
        }
    }
}
