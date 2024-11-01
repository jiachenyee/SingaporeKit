//
//  TwentyFourHourForecastView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit

struct TwentyFourHourForecastView: View {
    
    @Singapore(\.twentyFourHourWeather) var twentyFourHourWeather
    
    var body: some View {
        switch twentyFourHourWeather {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.description)")
        case .success(let data):
            let data = data.current!
            
            List {
                Section("General Forecast") {
                    LabeledContent("Weather") {
                        Label(data.general.weather.description, systemImage: data.general.weather.systemImage)
                    }
                    
                    LabeledContent("Relative Humidity (High)") {
                        Text("\(String(format: "%.1f", data.general.relativeHumidity.high))%")
                    }
                    
                    LabeledContent("Relative Humidity (Low)") {
                        Text("\(String(format: "%.1f", data.general.relativeHumidity.low))%")
                    }
                    
                    LabeledContent("Temperature (Low)") {
                        Text("\(String(format: "%.1f", data.general.temperature.low))℃")
                    }
                    
                    LabeledContent("Temperature (High)") {
                        Text("\(String(format: "%.1f", data.general.temperature.high))℃")
                    }
                    
                    LabeledContent("Wind Speed (Low)") {
                        Text("\(String(format: "%.1f", data.general.wind.low)) km/h")
                    }
                    
                    LabeledContent("Wind Speed (High)") {
                        Text("\(String(format: "%.1f", data.general.wind.high)) km/h")
                    }
                    
                    LabeledContent("Wind Direction") {
                        Text(data.general.wind.direction.description)
                    }
                    
                }
                
                ForEach(data.detailedForecasts) { forecast in
                    Section(forecast.timePeriod.description) {
                        LabeledContent("N") {
                            Label(forecast.north.description, systemImage: forecast.north.systemImage)
                        }
                        
                        LabeledContent("S") {
                            Label(forecast.south.description, systemImage: forecast.south.systemImage)
                        }
                        
                        LabeledContent("E") {
                            Label(forecast.east.description, systemImage: forecast.east.systemImage)
                        }
                        
                        LabeledContent("W") {
                            Label(forecast.west.description, systemImage: forecast.west.systemImage)
                        }
                        
                        LabeledContent("Central") {
                            Label(forecast.central.description, systemImage: forecast.central.systemImage)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TwentyFourHourForecastView()
}
