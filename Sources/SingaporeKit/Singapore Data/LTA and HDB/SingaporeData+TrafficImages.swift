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
            let result: TrafficImages.RetrievedData = try await sendGenericRequest(date: date, endpoint: "traffic-images")
            
            if let trafficImages = result.items.first {
                self.trafficImages = .success(trafficImages)
            } else {
                self.trafficImages = .failure(Error.notFound(nil))
            }
        } catch {
            trafficImages = .failure(error)
        }
    }
}
