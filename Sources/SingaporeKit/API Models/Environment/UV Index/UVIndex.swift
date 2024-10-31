//
//  UVIndex.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/31/24.
//

import Foundation

public struct UVIndex: Sendable, SingaporeDataValue {
    public typealias DataOption = DateOption
    
    public var records: [Record]
    
    public var date: String
    
    public var lastUpdated: Date
    
    public var timestamp: Date
}
