//
//  Calendar+Singapore.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension Calendar {
    static var singapore: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = .init(secondsFromGMT: 8 * 60 * 60)!
        return calendar
    }
}
