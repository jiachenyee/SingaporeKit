//
//  TwoHourForecastView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit

struct TwoHourForecastView: View {
    
    @Singapore(\.twoHourWeather) var twoHourWeather
    
    var body: some View {
        switch twoHourWeather {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.localizedDescription)")
        case .success(let data):
            let data = data.latest
            
            List(data.locations) { location in
                Section(location.area) {
                    Label(location.forecast.description, systemImage: location.forecast.systemImage)
                }
            }
        }
    }
}

#Preview {
    TwoHourForecastView()
}
