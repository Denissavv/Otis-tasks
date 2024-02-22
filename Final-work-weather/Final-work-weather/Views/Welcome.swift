//
//  Welcome.swift
//  Final-work-weather
//
//  Created by Денис on 21.02.2024.
//

import SwiftUI
import CoreLocationUI
import CoreLocation
import FirebaseAnalytics



struct Welcome: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20, content: {
                Text("Welcome to the weather app")
                    .font(.title)
                    .bold()
                
                Text("Please share you current location to get ")
                    .font(.headline)
            })
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
                FirebaseAnalytics.Analytics.logEvent("buttonPressed", parameters: ["longPress" : false])
            }
            .cornerRadius(30)
            .foregroundColor(.white)
            
        }
    }
}
    

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
