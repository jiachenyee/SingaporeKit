//
//  File.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension Date {
    func formatForAPI(withTime: Bool) -> String {
        var calendar = Calendar.singapore
        
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                 from: self)
        
        guard let year = components.year,
              let month = components.month,
              let day = components.day,
              let hour = components.hour,
              let minute = components.minute,
              let second = components.second else {
            fatalError("Error parsing date")
        }
        
        let wrappedYear = addLeadingZeros(year, numberOfDigits: 4)
        let wrappedMonth = addLeadingZeros(month, numberOfDigits: 2)
        let wrappedDay = addLeadingZeros(day, numberOfDigits: 2)
        let wrappedHour = addLeadingZeros(hour, numberOfDigits: 2)
        let wrappedMinute = addLeadingZeros(minute, numberOfDigits: 2)
        let wrappedSecond = addLeadingZeros(second, numberOfDigits: 2)
        
        var dateString = "\(wrappedYear)-\(wrappedMonth)-\(wrappedDay)"
        
        if withTime {
            dateString += "T\(wrappedHour):\(wrappedMinute):\(wrappedSecond)"
        }
        
        return dateString
    }
    
    private func addLeadingZeros(_ value: Int, numberOfDigits: Int) -> String {
        return String(format: "%0\(numberOfDigits)d", value)
    }
}
