//
//  SingaporeData+EnvironmentData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchEnvironmentData(dataset: String) async -> SingaporeDataResult<EnvironmentData> {
        let date = (dateOption ?? .now).date()
        
        var token: String?
        var result: EnvironmentRetrievedData?
        
        do {
            repeat {
                let currentPageResult = try await sendEnvironmentReadingRequest(date: date,
                                                                                withToken: token,
                                                                                dataset: "air-temperature")
                
                if result == nil {
                    result = currentPageResult
                } else {
                    result?.append(result: currentPageResult)
                }
                
                token = currentPageResult.paginationToken
            } while token != nil
        } catch {
            return .failure(Error.from(error))
        }
        
        if let value = result?.toEnvironmentData() {
            return .success(value)
        } else {
            return .failure(Error.notFound(nil))
        }
    }
    
    func sendEnvironmentReadingRequest(date: String,
                                       withToken paginationToken: String?,
                                       dataset: String) async throws -> EnvironmentRetrievedData {
        return try await sendEnvironmentRequest(date: date,
                                                withToken: paginationToken,
                                                endpoint: dataset)
    }
}
