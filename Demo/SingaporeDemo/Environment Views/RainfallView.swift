//
//  RainfallView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit

struct RainfallView: View {
    
    @Singapore(\.rainfall) var rainfall
    
    var body: some View {
        switch rainfall {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.localizedDescription)")
        case .success(let data):
            List(data.stations) { station in
                if let latestReading = data.latestReading(for: station) {
                    LabeledContent(station.name) {
                        Text("\(String(format: "%.1f", latestReading))mm")
                    }
                }
            }
        }
    }
}

#Preview {
    RainfallView()
}
