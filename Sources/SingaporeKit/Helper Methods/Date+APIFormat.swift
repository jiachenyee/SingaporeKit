//
//  Date+APIFormat.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension Date {
    func formatForAPI(withTime: Bool) -> String {
        let calendar = Calendar.singapore
        
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
    
    init?(iso8601Timestamp: String) {
        let isoFormatter = ISO8601DateFormatter()
        
        if let date = isoFormatter.date(from: iso8601Timestamp) {
            self = date
        } else {
            return nil
        }
    }
    
    static func decode<CodingKey>(from container: KeyedDecodingContainer<CodingKey>, forKey key: CodingKey) throws -> Date {
        var dateString = try container.decode(String.self, forKey: key)
        
        if !dateString.contains("T") {
            dateString += "T00:00:00+08:00"
        } else if !dateString.contains("+0") {
            dateString += "+08:00"
        }
        
        guard let date = Date(iso8601Timestamp: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: key, in: container, debugDescription: "Invalid ISO8601 string found: \(dateString)")
        }
        
        return date
    }
}
