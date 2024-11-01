//
//  TrafficImagesView.swift
//  SingaporeDemo
//
//  Created by Jia Chen Yee on 10/31/24.
//

import SwiftUI
import SingaporeKit

struct TrafficImagesView: View {
    
    @Singapore(\.trafficImages) var trafficImages
    
    var body: some View {
        switch trafficImages {
        case .none, .loading:
            ProgressView()
        case .failure(let error):
            Text("Failed to Load: \(error.localizedDescription)")
        case .success(let data):
            List(data.cameras) { camera in
                Section {
                    AsyncImage(url: camera.image) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Text("Last updated: \(camera.timestamp, style: .relative) ago")
                }
            }
        }
    }
}

#Preview {
    TrafficImagesView()
}
