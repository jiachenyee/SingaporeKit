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
    
    internal var dateOption: DateOption?
}
