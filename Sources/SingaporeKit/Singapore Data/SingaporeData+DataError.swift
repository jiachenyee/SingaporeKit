//
//  SingaporeData+DataError.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension SingaporeData {
    public enum Error: CustomStringConvertible {
        case dataNotFound
        case notFound(String)
        case apiError(String)
        
        public var description: String {
            switch self {
            case .dataNotFound:
                "Data not found"
            case .notFound(let string):
                "Not Found: \(string)"
            case .apiError(let string):
                "API Error: \(string)"
            }
        }
    }
}

extension SingaporeData.Error: Error {
    
}
