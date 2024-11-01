//
//  AirQualityView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit

struct AirQualityView: View {
    
    @Singapore(\.airQuality) var airQuality
    
    var body: some View {
        switch airQuality {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.localizedDescription)")
        case .success(let data):
            List {
                let measurement = data.latestMeasurement
                let readings = measurement.readings

                Section("Measurement") {
                    LabeledContent("Last Updated") {
                        Text("\(measurement.lastUpdated, style: .relative) ago")
                    }
                    LabeledContent("24-hour PSI",
                                   value: "\(readings.psiTwentyFourHourly.central)")
                }
                
                Section("Carbon Monoxide") {
                    LabeledContent("Sub index",
                                   value: "\(readings.coSubIndex.central) µg/m³")
                    LabeledContent("8-hour max",
                                   value: "\(readings.coSubIndex.central) µg/m³")
                }
                
                Section("Nitrogen Monoxide") {
                    LabeledContent("1-hour max",
                                   value: "\(readings.no2OneHourMax.central) µg/m³")
                }
                
                Section("Ozone") {
                    LabeledContent("Sub index",
                                   value: "\(readings.o3SubIndex.central) µg/m³")
                    LabeledContent("8-hour max",
                                   value: "\(readings.o3EightHourMax.central) µg/m³")
                }
                
                Section("PM10") {
                    LabeledContent("Sub index",
                                   value: "\(readings.pm10SubIndex.central) µg/m³")
                    LabeledContent("24 hourly",
                                   value: "\(readings.pm10TwentyFourHourly.central) µg/m³")
                }
                
                Section("PM2.5") {
                    LabeledContent("Sub index",
                                   value: "\(readings.pm25SubIndex.central) µg/m³")
                    LabeledContent("24 hourly",
                                   value: "\(readings.pm25TwentyFourHourly.central) µg/m³")
                }
                
                Section("Sulfur Dioxide") {
                    LabeledContent("Sub index",
                                   value: "\(readings.so2SubIndex.central) µg/m³")
                    LabeledContent("24 hourly",
                                   value: "\(readings.so2TwentyFourHourly.central) µg/m³")
                }
            }
            .monospacedDigit()
        }
    }
}

#Preview {
    AirQualityView()
}
