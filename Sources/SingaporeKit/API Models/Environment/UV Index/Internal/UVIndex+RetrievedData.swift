//
//  UVIndex+RetrievedData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

extension UVIndex {
    struct RetrievedData: Decodable {
        var records: [RetrievedRecord]
        let paginationToken: String?
        
        func toUVIndex() -> UVIndex? {
            let indexes = self.records.flatMap { $0.index }
            
            guard let date = self.records.first?.date,
                  let maxLastUpdated = records.max(by: { $0.lastUpdated < $1.lastUpdated })?.lastUpdated,
                  let maxTimestamp = records.max(by: { $0.timestamp < $1.timestamp })?.timestamp else {
                return nil
            }
            
            return UVIndex(records: indexes,
                           date: date,
                           lastUpdated: maxLastUpdated,
                           timestamp: maxTimestamp)
        }
    }
}
