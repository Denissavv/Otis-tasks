//
//  SwiftUIView.swift
//  Final-work-weather
//
//  Created by Денис on 21.02.2024.
//

import SwiftUI

struct Home: View {
    @StateObject var locationManager = LocationManager()
    @State var weather: ResponseBody?
    var weatherManager = WeatherManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    ProgressView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentweather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Something went wrong")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    Welcome()
                        .environmentObject(locationManager)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color("light"), Color("dark")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

