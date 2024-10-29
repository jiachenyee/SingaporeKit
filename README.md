# @Singapore [WIP]
## access [singapore government real-time data](https://data.gov.sg/datasets?formats=API) in swiftui, in an easy and succinct way
use the `@Singapore` property wrapper to access singapore government data

### the property wrapper
```swift
@Singapore(\.uvIndex) var uvIndex
@Singapore(\.carparkAvailability) var carparkAvailability
```
you can also supply an option, such as a date.
```swift
@Singapore(\.rainfall, options: .moment(yesterday)) var uvIndex
```

### here's an example
```swift
struct RelativeHumidityView: View {
    
    @Singapore(\.relativeHumidity) var relativeHumidity
    
    var body: some View {
        Group {
            switch relativeHumidity {
            case .loading, .none: ProgressView()
            case .failure: Text("Failed to fetch data")
            case .success(let relativeHumidity):
                List(relativeHumidity.stations) { station in
                    Section {
                        Map {
                            Marker("\(station.name)", coordinate: station.location.coordinate)
                        }
                        .frame(height: 100)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        Text(station.name)
                        
                        LabeledContent("Station ID") {
                            Text(station.id)
                        }
                        
                        if let latestReading = relativeHumidity.latestReading(for: station) {
                            Label("\(String(format: "%.1f", latestReading))%",
                                  systemImage: "humidity")
                        }
                    }
                }
            }
        }
        .navigationTitle("Locations")
    }
}
```

## roadmap
### features
- [x] relative humidity
- [x] 24h forecast
- [x] carpark availability
- [x] air temperature
- [x] rainfall
- [x] psi
- [x] uvi
- [ ] 4 day forecast
- [ ] traffic images
- [ ] taxi
- [ ] 2h forecast

### others
- [ ] docc documentation
- [ ] sample projects
