//
//  WeatherManager.swift
//  Final-work-weather
//
//  Created by Денис on 21.02.2024.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    //open wearher API: c82de61b8b648e0689e37568e865cb27
    
    func getCurrentweather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        let urlForFetch: String = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=c82de61b8b648e0689e37568e865cb27&units=metrics"

        
        print(urlForFetch)
        guard let url = URL(string: urlForFetch) else {
            
            fatalError("Something went wrong") }
 
        let urIRequest = URLRequest(url: url)
        
        let (data, res) = try await URLSession.shared.data(for: urIRequest)
        
        guard (res as? HTTPURLResponse)?.statusCode == 200 else { fatalError ("Error fetching weather dal")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}


struct ResponseBody: Decodable {
    
    var coord: CoordinateResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinateResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}
    
    extension ResponseBody.MainResponse {
        var feelsLike: Double { return feels_like }
        var tempMin: Double {return temp_min}
        var tempMax:Double {return temp_max}
    }
        

