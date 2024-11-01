//
//  UVIndexView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit
import Charts

struct UVIndexView: View {
    
    @Singapore(\.uvIndex) var uvIndex
    
    var body: some View {
        switch uvIndex {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.localizedDescription)")
        case .success(let data):
            List {
                Section("Today's UV Index") {
                    Chart(data.records) { record in
                        LineMark(
                            x: .value("Hour", record.date),
                            y: .value("UV Index", record.value)
                        )
                    }
                    .frame(height: 200)
                    
                    Text("Last updated: \(data.timestamp, style: .relative) ago")
                }
                
                Section("All Data") {
                    ForEach(data.records) { record in
                        LabeledContent("\(record.date, style: .time)", value: "\(record.value)")
                    }
                    .monospacedDigit()
                }
            }
        }
    }
}

#Preview {
    UVIndexView()
}
