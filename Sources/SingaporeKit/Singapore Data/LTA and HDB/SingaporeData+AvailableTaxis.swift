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
            availableTaxis = .success(try await sendGenericRequest(date: date, endpoint: "taxi-availability"))
        } catch {
            availableTaxis = .failure(error)
        }
    }
}
