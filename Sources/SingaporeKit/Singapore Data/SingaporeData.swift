//
//  SingaporeData.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/21/24.
//

import Foundation

@MainActor
@Observable
public class SingaporeData {
    /// Get relative humidity readings across Singapore.
    ///
    /// Minute-by-minute relative humidity readings at weather-station level, updated every five minutes.
    ///
    /// These data are collected from automated weather instruments, and is automatically published as soon as it is generated. There could be instances when there are gaps in the data due to technical problems. The data is subject to correction subsequently if necessary.
    ///
    /// While every effort has been made to site the instruments in relatively unobstructed areas to provide the best possible indication of the general weather conditions, there are times when this is not possible. The readings from the instruments could thus be influenced by local conditions.
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the relative humidity data.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// ```swift
    /// struct RelativeHumidityView: View {
    ///
    ///     @Singapore(\.relativeHumidity) var relativeHumidity
    ///
    ///     var body: some View {
    ///         switch relativeHumidity {
    ///         case .none, .loading:
    ///             ProgressView()
    ///         case .failure(let error):
    ///             Text("Failed to Load: \(error.localizedDescription)")
    ///         case .success(let data):
    ///             List(data.stations) { station in
    ///                 if let latestReading = data.latestReading(for: station) {
    ///                     LabeledContent(station.name) {
    ///                         Text("\(String(format: "%.1f", latestReading))%")
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public var relativeHumidity: SingaporeDataResult<EnvironmentData> = .none
    
    /// Get air temperature readings from across Singapore.
    ///
    /// Minute-by-minute air temperature readings at weather-station level.
    ///
    /// These data are collected from automated weather instruments, and is automatically published as soon as it is generated. There could be instances when there are gaps in the data due to technical problems. The data is subject to correction subsequently if necessary.
    ///
    /// While every effort has been made to site the instruments in relatively unobstructed areas to provide the best possible indication of the general weather conditions, there are times when this is not possible. The measurements from the instruments could thus be influenced by local conditions e.g., measurements at some coastal stations may be strongly influenced by the surrounding sea.
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the air temperature data.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// ```swift
    /// struct AirTemperatureView: View {
    ///
    ///     @Singapore(\.airTemperature) var airTemperature
    ///
    ///     var body: some View {
    ///         switch airTemperature {
    ///         case .none, .loading:
    ///             ProgressView()
    ///         case .failure(let error):
    ///             Text("Failed to Load: \(error.localizedDescription)")
    ///         case .success(let data):
    ///             List(data.stations) { station in
    ///                 if let latestReading = data.latestReading(for: station) {
    ///                     LabeledContent(station.name) {
    ///                         Text("\(String(format: "%.1f", latestReading))℃")
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public var airTemperature: SingaporeDataResult<EnvironmentData> = .none
    
    /// Get precipitation readings from across Singapore.
    ///
    /// Precipitation readings at weather-station level, updated every five minutes.
    ///
    /// These data are collected from automated weather instruments, and is automatically published as soon as it is generated. There could be instances when there are gaps in the data due to technical problems. The data is subject to correction subsequently if necessary.
    ///
    /// While every effort has been made to site the instruments in relatively unobstructed areas to provide the best possible indication of the general weather conditions, there are times when this is not possible. The readings from the instruments could thus be influenced by local conditions.
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the precipitation readings.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// ```swift
    /// struct RainfallView: View {
    ///
    ///     @Singapore(\.rainfall) var rainfall
    ///
    ///     var body: some View {
    ///         switch rainfall {
    ///         case .none, .loading:
    ///             ProgressView()
    ///         case .failure(let error):
    ///             Text("Failed to Load: \(error.localizedDescription)")
    ///         case .success(let data):
    ///             List(data.stations) { station in
    ///                 if let latestReading = data.latestReading(for: station) {
    ///                     LabeledContent(station.name) {
    ///                         Text("\(String(format: "%.1f", latestReading))mm")
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public var rainfall: SingaporeDataResult<EnvironmentData> = .none
    
    /// Get air quality readings from across Singapore.
    ///
    /// These data are collected from automated weather instruments, and is automatically published as soon as it is generated. There could be instances when there are gaps in the data due to technical problems. The data is subject to correction subsequently if necessary.
    ///
    /// While every effort has been made to site the instruments in relatively unobstructed areas to provide the best possible indication of the general weather conditions, there are times when this is not possible. The readings from the instruments could thus be influenced by local conditions.
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the air quality data.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// In the following examplem you can retrieve the latest air quality data and display it in a SwiftUI view.
    ///
    /// ```swift
    /// struct AirQualityView: View {
    ///
    ///    @Singapore(\.airQuality) var airQuality
    ///
    ///    var body: some View {
    ///        switch airQuality {
    ///        case .none, .loading:
    ///            ProgressView()
    ///        case .failure(let error):
    ///            Text("Failed to Load: \(error.localizedDescription)")
    ///        case .success(let data):
    ///            List {
    ///                let measurement = data.latestMeasurement
    ///                let readings = measurement.readings
    ///
    ///                Section("Measurement") {
    ///                    LabeledContent("Last Updated") {
    ///                        Text("\(measurement.lastUpdated, style: .relative) ago")
    ///                    }
    ///                    LabeledContent("24-hour PSI",
    ///                                   value: "\(readings.psiTwentyFourHourly.central)")
    ///                }
    ///
    ///                Section("Carbon Monoxide") {
    ///                    LabeledContent("Sub index",
    ///                                   value: "\(readings.coSubIndex.central) µg/m³")
    ///                    LabeledContent("8-hour max",
    ///                                   value: "\(readings.coSubIndex.central) µg/m³")
    ///                }
    ///
    ///                Section("Nitrogen Monoxide") {
    ///                    LabeledContent("1-hour max",
    ///                                   value: "\(readings.no2OneHourMax.central) µg/m³")
    ///                }
    ///
    ///                Section("Ozone") {
    ///                    LabeledContent("Sub index",
    ///                                   value: "\(readings.o3SubIndex.central) µg/m³")
    ///                    LabeledContent("8-hour max",
    ///                                   value: "\(readings.o3EightHourMax.central) µg/m³")
    ///                }
    ///
    ///                Section("PM10") {
    ///                    LabeledContent("Sub index",
    ///                                   value: "\(readings.pm10SubIndex.central) µg/m³")
    ///                    LabeledContent("24 hourly",
    ///                                   value: "\(readings.pm10TwentyFourHourly.central) µg/m³")
    ///                }
    ///
    ///                Section("PM2.5") {
    ///                    LabeledContent("Sub index",
    ///                                   value: "\(readings.pm25SubIndex.central) µg/m³")
    ///                    LabeledContent("24 hourly",
    ///                                   value: "\(readings.pm25TwentyFourHourly.central) µg/m³")
    ///                }
    ///
    ///                Section("Sulfur Dioxide") {
    ///                    LabeledContent("Sub index",
    ///                                   value: "\(readings.so2SubIndex.central) µg/m³")
    ///                    LabeledContent("24 hourly",
    ///                                   value: "\(readings.so2TwentyFourHourly.central) µg/m³")
    ///                }
    ///            }
    ///            .monospacedDigit()
    ///        }
    ///    }
    ///}
    /// ```
    public var airQuality: SingaporeDataResult<AirQuality.RetrievedData> = .none
    
    /// Get UV Index readings from all 5 regions of Singapore.
    ///
    /// UV index readings for the North, South, East, West, and Central regions.
    ///
    /// These data are collected from automated weather instruments, and is automatically published as soon as it is generated. There could be instances when there are gaps in the data due to technical problems. The data is subject to correction subsequently if necessary.
    ///
    /// While every effort has been made to site the instruments in relatively unobstructed areas to provide the best possible indication of the general weather conditions, there are times when this is not possible. The readings from the instruments could thus be influenced by local conditions.
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the air temperature data.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// ```swift
    /// struct UVIndexView: View {
    ///
    ///     @Singapore(\.uvIndex) var uvIndex
    ///
    ///     var body: some View {
    ///         switch uvIndex {
    ///         case .none, .loading:
    ///             ProgressView()
    ///         case .failure(let error):
    ///             Text("Failed to Load: \(error.localizedDescription)")
    ///         case .success(let data):
    ///             List {
    ///                 Section("Today's UV Index") {
    ///                     Chart(data.records) { record in
    ///                         LineMark(
    ///                             x: .value("Hour", record.date),
    ///                             y: .value("UV Index", record.value)
    ///                         )
    ///                     }
    ///                     .frame(height: 200)
    ///
    ///                     Text("Last updated: \(data.timestamp, style: .relative) ago")
    ///                 }
    ///
    ///                 Section("All Data") {
    ///                     ForEach(data.records) { record in
    ///                         LabeledContent("\(record.date, style: .time)", value: "\(record.value)")
    ///                     }
    ///                     .monospacedDigit()
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    public var uvIndex: SingaporeDataResult<UVIndex> = .none
    
    public var twentyFourHourWeather: SingaporeDataResult<[TwentyFourHourWeather.Record]> = .none
    
    public var twoHourWeather: SingaporeDataResult<[TwoHourForecast.Forecasts]> = .none
    
    public var fourDayForecast: SingaporeDataResult<FourDayForecast> = .none
    
    /// Get carpark availability at HDB carparks across Singapore.
    ///
    /// For information on the Carpark Code, refer to [this dataset](https://data.gov.sg/dataset/hdb-carpark-information)
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the air temperature data.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// ```swift
    /// struct CarparkAvailabilityView: View {
    ///
    ///     @Singapore(\.carparkAvailability) var carparkAvailability
    ///
    ///     var body: some View {
    ///         switch carparkAvailability {
    ///         case .none, .loading:
    ///             ProgressView()
    ///         case .failure(let error):
    ///             Text("Failed to Load: \(error.localizedDescription)")
    ///         case .success(let data):
    ///             List(data.carparks) { carpark in
    ///                 Section(carpark.number) {
    ///                     ForEach(carpark.lots, id: \.type) { lot in
    ///                         LabeledContent("Type \(lot.type)") {
    ///                             Gauge(value: lot.percentAvailable) {
    ///                                 Text("\(lot.available) / \(lot.total)")
    ///                                     .multilineTextAlignment(.center)
    ///                             }
    ///                             .gaugeStyle(.accessoryCircularCapacity)
    ///                         }
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    public var carparkAvailability: SingaporeDataResult<CarparkAvailability> = .none
    
    /// Get traffic images from traffic cameras across Singapore.
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the traffic images.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// ```swift
    /// struct TrafficImagesView: View {
    ///
    ///     @Singapore(\.trafficImages) var trafficImages
    ///
    ///     var body: some View {
    ///         switch trafficImages {
    ///         case .none, .loading:
    ///             ProgressView()
    ///         case .failure(let error):
    ///             Text("Failed to Load: \(error.localizedDescription)")
    ///         case .success(let data):
    ///             List(data.cameras) { camera in
    ///                 Section {
    ///                     AsyncImage(url: camera.image) { image in
    ///                         image
    ///                             .resizable()
    ///                             .scaledToFill()
    ///                     } placeholder: {
    ///                         ProgressView()
    ///                     }
    ///                     .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    ///
    ///                     Text("Last updated: \(camera.timestamp, style: .relative) ago")
    ///                 }
    ///             }
    ///         }
    ///     }
    /// }
    public var trafficImages: SingaporeDataResult<TrafficImages> = .none
    
    /// Get available taxis across Singapore.
    ///
    /// For more information, visit the [data.gov.sg](https://data.gov.sg/datasets?formats=API).
    ///
    /// ## Usage
    /// Use the `@Singapore` property wrapper to access the available taxi locations.
    ///
    /// You can use a Switch statement to handle the different states of the data:
    /// - `.none`: The data has not been loaded yet.
    /// - `.loading`: The data is currently being loaded.
    /// - `.failure`: The data failed to load.
    /// - `.success`: The data has been successfully loaded.
    ///
    /// Using the success parameter, you can access the data and display it in your SwiftUI view.
    ///
    /// ```swift
    /// struct AvailableTaxisView: View {
    ///
    ///     @Singapore(\.availableTaxis) var availableTaxis
    ///
    ///     var body: some View {
    ///         switch availableTaxis {
    ///         case .none, .loading:
    ///             ProgressView()
    ///         case .failure(let error):
    ///             Text("Failed to Load: \(error.localizedDescription)")
    ///         case .success(let data):
    ///             ZStack(alignment: .top) {
    ///                 Map {
    ///                     ForEach(data.locations, id: \.hashValue) { location in
    ///                         Marker("", systemImage: "car", coordinate: location.coordinate)
    ///                     }
    ///                 }
    ///
    ///                 VStack {
    ///                     Text("\(data.taxiCount)")
    ///                         .font(.largeTitle)
    ///                         .fontWeight(.bold)
    ///                     Text("Available Taxis")
    ///
    ///                     Text("Last updated: \(data.timestamp, style: .relative)")
    ///                         .font(.caption)
    ///                 }
    ///                 .multilineTextAlignment(.center)
    ///                 .frame(maxWidth: .infinity)
    ///                 .padding()
    ///                 .background(.thickMaterial)
    ///                 .clipShape(.rect(cornerRadius: 16))
    ///                 .padding()
    ///             }
    ///         }
    ///     }
    /// }
    public var availableTaxis: SingaporeDataResult<AvailableTaxis> = .none
    
    internal var dateOption: DateOption?
    internal var momentOption: MomentOption?
}
