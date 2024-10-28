//
//  SingaporeData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

@MainActor
@Observable
public class SingaporeData {
    /// Get relative humidity readings across Singapore
    public var relativeHumidity: SingaporeDataResult<RelativeHumidity> = .none
    
    public var twentyFourHourWeather: SingaporeDataResult<[TwentyFourHourWeather.Record]> = .none
    
    internal var dateOption: DateOption?
}
