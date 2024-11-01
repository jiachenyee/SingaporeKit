//
//  ContentView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Environment Metrics") {
                    NavigationLink {
                        AirQualityView()
                            .navigationTitle("Air Quality")
                    } label: {
                        Label("Air Quality", systemImage: "cloud")
                    }
                    
                    NavigationLink {
                        AirTemperatureView()
                            .navigationTitle("Air Temperature")
                    } label: {
                        Label("Air Temperature", systemImage: "thermometer.medium")
                    }
                    
                    NavigationLink {
                        RainfallView()
                            .navigationTitle("Rainfall")
                    } label: {
                        Label("Rainfall", systemImage: "cloud.rain")
                    }
                    
                    NavigationLink {
                        RelativeHumidityView()
                            .navigationTitle("Relative Humidity")
                    } label: {
                        Label("Relative Humidity", systemImage: "humidity")
                    }
                    
                    NavigationLink {
                        UVIndexView()
                            .navigationTitle("UV Index")
                    } label: {
                        Label("UV Index", systemImage: "sun.max")
                    }
                }
                
                Section("Weather Forecasts") {
                    NavigationLink {
                        TwoHourForecastView()
                            .navigationTitle("2 Hour Forecast")
                    } label: {
                        Label("2 Hour Forecast", systemImage: "cloud.sun")
                    }
                    
                    NavigationLink {
                        TwentyFourHourForecastView()
                            .navigationTitle("24 Hour Forecast")
                    } label: {
                        Label(("24 Hour Forecast"), systemImage: "cloud.sun")
                    }
                    
                    NavigationLink {
                        FourDayForecastView()
                            .navigationTitle("4 Day Forecast")
                    } label: {
                        Label(("24 Hour Forecast"), systemImage: "calendar")
                    }
                }
                
                Section("Transport Datasets") {
                    NavigationLink {
                        CarparkAvailabilityView()
                            .navigationTitle("Carpark Availability")
                    } label: {
                        Label("Carpark Availability", systemImage: "parkingsign.circle")
                    }
                    
                    NavigationLink {
                        TrafficImagesView()
                            .navigationTitle("Traffic Images")
                    } label: {
                        Label("Traffic Images", systemImage: "car.rear.road.lane")
                    }
                    
                    NavigationLink {
                        AvailableTaxisView()
                            .navigationTitle("Available Taxis")
                    } label: {
                        Label("Available Taxis", systemImage: "car")
                    }
                }
            }
            .navigationTitle("@Singapore")
        }
    }
}

#Preview {
    ContentView()
}
