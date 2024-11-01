//
//  SingaporeData+AvailableTaxis.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchAvailableTaxis() async {
        await performRequest(for: momentOption, refreshDuration: 60) {
            await sendAvailableTaxisRequest()
        } set: { result in
            availableTaxis = result
        }
    }
    
    func sendAvailableTaxisRequest() async -> SingaporeDataResult<AvailableTaxis> {
        let date = (momentOption ?? .now).date()
        
        do {
            return .success(try await sendGenericRequest(date: date, endpoint: "taxi-availability"))
        } catch {
            return .failure(error)
        }
    }
}
