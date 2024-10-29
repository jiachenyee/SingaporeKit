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
            switch keyPath {
            case \.relativeHumidity: await singaporeData.fetchRelativeHumidity()
            case \.twentyFourHourWeather: await singaporeData.fetch24hWeather()
            case \.carparkAvailability: await singaporeData.fetchCarparkAvailability()
            case \.airTemperature: await singaporeData.fetchAirTemperature()
            case \.rainfall: await singaporeData.fetchRainfall()
            case \.psi: await singaporeData.fetchPSI()
            case \.uvIndex: await singaporeData.fetchUVIndex()
            case \.trafficImages: await singaporeData.fetchTrafficImages()
            case \.availableTaxis: await singaporeData.fetchAvailableTaxis()
            default: break
            }
        }
    }
    
    mutating func updateValue(_ newValue: Value) {
    }
}
