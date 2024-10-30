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
    ///
    /// ## Topics
    /// ### Environment Datasets
    /// - ``airTemperature``
    /// - ``psi``
    /// - ``rainfall``
    /// - ``uvIndex``
    ///
    /// ### Environment Forecasts
    /// - ``twoHourWeather``
    /// - ``twentyFourHourWeather``
    /// - ``fourDayForecast``
    ///
    /// ### Transport Datasets
    /// - ``availableTaxis``
    /// - ``carparkAvailability``
    /// - ``trafficImages``
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
    ///
    /// ## Topics
    /// ### Environment Datasets
    /// - ``airTemperature``
    /// - ``psi``
    /// - ``rainfall``
    /// - ``relativeHumidity``
    /// - ``uvIndex``
    ///
    /// ### Environment Forecasts
    /// - ``twoHourWeather``
    /// - ``twentyFourHourWeather``
    /// - ``fourDayForecast``
    ///
    /// ### Transport Datasets
    /// - ``availableTaxis``
    /// - ``carparkAvailability``
    /// - ``trafficImages``
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
    ///
    /// ## Topics
    /// ### Environment Datasets
    /// - ``airTemperature``
    /// - ``psi``
    /// - ``rainfall``
    /// - ``relativeHumidity``
    /// - ``uvIndex``
    ///
    /// ### Environment Forecasts
    /// - ``twoHourWeather``
    /// - ``twentyFourHourWeather``
    /// - ``fourDayForecast``
    ///
    /// ### Transport Datasets
    /// - ``availableTaxis``
    /// - ``carparkAvailability``
    /// - ``trafficImages``
    public var rainfall: SingaporeDataResult<EnvironmentData> = .none
    
    public var psi: SingaporeDataResult<EnvironmentData> = .none
    
    public var uvIndex: SingaporeDataResult<EnvironmentData> = .none
    
    public var twentyFourHourWeather: SingaporeDataResult<[TwentyFourHourWeather.Record]> = .none
    
    public var twoHourWeather: SingaporeDataResult<[TwoHourForecast.Forecasts]> = .none
    
    public var fourDayForecast: SingaporeDataResult<FourDayForecast> = .none
    
    public var carparkAvailability: SingaporeDataResult<CarparkAvailability> = .none
    
    public var trafficImages: SingaporeDataResult<TrafficImages> = .none
    
    public var availableTaxis: SingaporeDataResult<AvailableTaxis> = .none
    
    internal var dateOption: DateOption?
    internal var momentOption: MomentOption?
}
