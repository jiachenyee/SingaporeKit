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
        
        fetchData()
    }
    
    public init(_ keyPath: KeyPath<SingaporeData, Value>,
                options: Value.DataOption) {
        self.keyPath = keyPath
        
        if let options = options as? DateOption {
            singaporeData.dateOption = options
        }
        
        fetchData()
    }
    
    func fetchData() {
        Task {
            if keyPath.debugDescription.contains("relativeHumidity") {
                await singaporeData.fetchRelativeHumidity()
            } else if keyPath.debugDescription.contains("twentyFourHourWeather") {
                await singaporeData.fetch24hWeather()
            } else if keyPath.debugDescription.contains("carparkAvailability") {
                await singaporeData.fetchCarparkAvailability()
            } else if keyPath.debugDescription.contains("airTemperature") {
                await singaporeData.fetchAirTemperature()
            } else if keyPath.debugDescription.contains("rainfall") {
                await singaporeData.fetchRainfall()
            } else if keyPath.debugDescription.contains("psi") {
                await singaporeData.fetchPSI()
            } else if keyPath.debugDescription.contains("uvIndex") {
                await singaporeData.fetchUVIndex()
            }
        }
    }
    
    mutating func updateValue(_ newValue: Value) {
    }
}
