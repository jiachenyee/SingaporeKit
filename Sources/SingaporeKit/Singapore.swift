//
//  Singapore.swift
//  SingaporeKit Demo
//
//  Created by Jia Chen Yee on 10/20/24.
//

import Foundation
import SwiftUI
import Observation

@propertyWrapper @MainActor
public struct Singapore<Value>: DynamicProperty where Value: SingaporeDataValue {
    
    @State private var singaporeData = SingaporeData()
    
    private var keyPath: KeyPath<SingaporeData, Value>
    
    public var wrappedValue: Value {
        get {
            singaporeData[keyPath: keyPath]
        }
    }
    
    public init(_ keyPath: KeyPath<SingaporeData, Value>) {
        self.keyPath = keyPath
        
        if keyPath.debugDescription.contains("relativeHumidity") {
            singaporeData.fetchRelativeHumidity()
        }
    }
    
    public init(_ keyPath: KeyPath<SingaporeData, Value>,
                options: Value.DataOption) {
        self.keyPath = keyPath
        
        if let options = options as? DateOption {
            singaporeData.dateOption = options
        }
        
        if keyPath.debugDescription.contains("relativeHumidity") {
            singaporeData.fetchRelativeHumidity()
        }
    }
    
    mutating func updateValue(_ newValue: Value) {
    }
}
