//
//  SingaporeDataResult.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

public enum SingaporeDataResult<Value: SingaporeDataValue & Sendable>: SingaporeDataValue, Sendable {
    public typealias DataOption = Value.DataOption
    
    case none
    case loading
    case success(Value)
    case failure(Error)
}
