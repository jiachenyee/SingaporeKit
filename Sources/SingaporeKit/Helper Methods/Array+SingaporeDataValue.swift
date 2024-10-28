//
//  Array+SingaporeDataValue.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

extension Array: SingaporeDataValue where Element: SingaporeDataValue {
    public typealias DataOption = Element.DataOption
}
