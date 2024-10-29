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
    public var relativeHumidity: SingaporeDataResult<EnvironmentData> = .none
    
    public var airTemperature: SingaporeDataResult<EnvironmentData> = .none
    
    public var rainfall: SingaporeDataResult<EnvironmentData> = .none
    
    public var twentyFourHourWeather: SingaporeDataResult<[TwentyFourHourWeather.Record]> = .none
    
    public var carparkAvailability: SingaporeDataResult<CarparkAvailability> = .none
    
    internal var dateOption: DateOption?
    internal var momentOption: MomentOption?
}
