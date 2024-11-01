//
//  CarparkAvailabilityView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit

struct CarparkAvailabilityView: View {
    
    @Singapore(\.carparkAvailability) var carparkAvailability
    
    var body: some View {
        switch carparkAvailability {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.localizedDescription)")
        case .success(let data):
            List(data.carparks) { carpark in
                Section(carpark.number) {
                    ForEach(carpark.lots, id: \.type) { lot in
                        LabeledContent("Type \(lot.type)") {
                            Gauge(value: lot.percentAvailable) {
                                Text("\(lot.available) / \(lot.total)")
                                    .multilineTextAlignment(.center)
                            }
                            .gaugeStyle(.accessoryCircularCapacity)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CarparkAvailabilityView()
}
