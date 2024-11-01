//
//  SingaporeData+TrafficImages.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchTrafficImages() async {
        await performRequest(for: momentOption, refreshDuration: 60) {
            await sendTrafficImagesRequest()
        } set: {
            trafficImages = $0
        }
    }
    
    func sendTrafficImagesRequest() async -> SingaporeDataResult<TrafficImages> {
        let date = (momentOption ?? .now).date()
        
        do {
            let result: TrafficImages.RetrievedData = try await sendGenericRequest(date: date, endpoint: "traffic-images")
            
            if let trafficImages = result.items.first {
                return .success(trafficImages)
            } else {
                return .failure(Error.notFound(nil))
            }
        } catch {
            return .failure(error)
        }
    }
}
