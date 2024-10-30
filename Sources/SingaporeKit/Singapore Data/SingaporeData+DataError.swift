//
//  SingaporeData+DataError.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/30/24.
//

import Foundation

extension SingaporeData {
    public enum Error: CustomStringConvertible, CustomDebugStringConvertible {
        case notFound(String?)
        case apiError(String)
        case unexpectedServerResponse
        case urlError(URLError)
        case decodingError(DecodingError)
        case unknown
        
        public var description: String {
            switch self {
            case .notFound(let string):
                if let string {
                    "Not Found: \(string)"
                } else {
                    "Not Found"
                }
            case .apiError(let string):
                "API Error: \(string)"
            case .unexpectedServerResponse:
                "Unexpected server response"
            case .urlError(let error):
                "URL Error: \(error.localizedDescription)"
            case .decodingError(let error):
                "Decoding Error: \(error.localizedDescription)"
            case .unknown:
                "Unknown Error"
            }
        }
        
        public var debugDescription: String {
            switch self {
            case .notFound(let string):
                if let string {
                    "Not Found: \(string)"
                } else {
                    "Not Found"
                }
            case .apiError(let string):
                "API Error: \(string)"
            case .unexpectedServerResponse:
                "Unexpected server response"
            case .urlError(let error):
                "URL Error: \(error.localizedDescription)"
            case .decodingError(let error):
                "Decoding Error: \(error)"
            case .unknown:
                "Unknown Error"
            }
        }
        
        static func from(_ error: Swift.Error) -> SingaporeData.Error {
            switch error {
            case let error as Error:
                return error
            case let error as URLError:
                return .urlError(error)
            case let error as DecodingError:
                return .decodingError(error)
            default:
                return .unknown
            }
        }
    }
}

extension SingaporeData.Error: Error {
    
}
