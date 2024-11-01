//
//  MomentOption.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

public enum MomentOption: SingaporeDataOption, Sendable {
    public var `default`: Self {
        .now
    }
    
    case now
    case at(Date)
    
    case realTime(TimeInterval? = nil)
    
    func date() -> String {
        let targetDate: Date
        
        switch self {
        case .now, .realTime: targetDate = .now
        case .at(let date):
            targetDate = date
        }
        return targetDate.formatForAPI(withTime: true)
    }
}
