//
//  AvailableTaxisView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit
import MapKit

struct AvailableTaxisView: View {
    
    @Singapore(\.availableTaxis) var availableTaxis
    
    var body: some View {
        switch availableTaxis {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.description)")
        case .success(let data):
            ZStack(alignment: .top) {
                Map {
                    ForEach(data.locations, id: \.hashValue) { location in
                        Marker("", systemImage: "car", coordinate: location.coordinate)
                    }
                }
                
                VStack {
                    Text("\(data.taxiCount)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Available Taxis")
                    
                    Text("Last updated: \(data.timestamp, style: .relative)")
                        .font(.caption)
                }
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.thickMaterial)
                .clipShape(.rect(cornerRadius: 16))
                .padding()
            }
        }
    }
}

#Preview {
    AvailableTaxisView()
}
