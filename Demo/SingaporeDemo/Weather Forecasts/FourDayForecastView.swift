//
//  FourDayForecast.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 11/2/24.
//

import SwiftUI
import SingaporeKit

struct FourDayForecastView: View {
    
    @Singapore(\.fourDayForecast) var fourDayForecast
    
    var body: some View {
        switch fourDayForecast {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.description)")
        case .success(let data):
            List {
                ForEach(data.forecasts) { forecast in
                    Section(forecast.day) {
                        Label(forecast.weather.summary, systemImage: forecast.weather.weather.systemImage)
                        
                        LabeledContent("Relative Humidity (High)") {
                            Text("\(String(format: "%.1f", forecast.relativeHumidity.high))%")
                        }
                        
                        LabeledContent("Relative Humidity (Low)") {
                            Text("\(String(format: "%.1f", forecast.relativeHumidity.low))%")
                        }
                        
                        LabeledContent("Temperature (Low)") {
                            Text("\(String(format: "%.1f", forecast.temperature.low))℃")
                        }
                        
                        LabeledContent("Temperature (High)") {
                            Text("\(String(format: "%.1f", forecast.temperature.high))℃")
                        }
                        
                        LabeledContent("Wind Speed (Low)") {
                            Text("\(String(format: "%.1f", forecast.wind.low)) km/h")
                        }
                        
                        LabeledContent("Wind Speed (High)") {
                            Text("\(String(format: "%.1f", forecast.wind.high)) km/h")
                        }
                        
                        LabeledContent("Wind Direction") {
                            Text(forecast.wind.direction.description)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    FourDayForecastView()
}
