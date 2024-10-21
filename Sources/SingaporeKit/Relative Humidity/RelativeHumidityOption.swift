//
//  DateOption.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public enum DateOption: SingaporeDataOption, Sendable {
    public var `default`: Self {
        .now
    }
    
    case now
    case today
    case moment(Date)
    case day(Date)
    
    func date() -> String {
        let targetDate: Date
        var withTime: Bool
        
        switch self {
        case .now:
            targetDate = .now
            withTime = true
        case .today:
            targetDate = .now
            withTime = false
        case .moment(let date):
            targetDate = date
            withTime = true
        case .day(let date):
            targetDate = date
            withTime = false
        }
        
        return targetDate.formatForAPI(withTime: withTime)
    }
}
