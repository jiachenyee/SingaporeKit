//
//  SingaporeData+UVI.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchUVIndex() async {
        uvIndex = .loading
        
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var uviResult: UVIndex?
        
        do {
            repeat {
                let result: UVIndex.RetrievedData = try await sendEnvironmentRequest(date: date,
                                                                                     withToken: token,
                                                                                     endpoint: "uv")
                
                if uviResult == nil {
                    uviResult = result.toUVIndex()
                } else {
                    let indexes = result.records.flatMap(\.index)
                    
                    uviResult?.records.append(contentsOf: indexes)
                    
                    guard let newTimestamp = result.records.max(by: { $0.timestamp < $1.timestamp })?.timestamp else { continue }
                    if uviResult!.lastUpdated < newTimestamp {
                        uviResult!.lastUpdated = newTimestamp
                    }
                }
                
                token = result.paginationToken
            } while token != nil
        } catch {
            uvIndex = .failure(error)
            return
        }
        
        uviResult?.records.sort(by: { $0.date < $1.date })
        
        if let uviResult, !uviResult.records.isEmpty {
            uvIndex = .success(uviResult)
        } else {
            uvIndex = .failure(Error.notFound(nil))
        }
    }
}
