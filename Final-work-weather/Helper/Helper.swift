//
//  Helper.swift
//  Final-work-weather
//
//  Created by Денис on 22.02.2024.
//

import Foundation


enum WeatherGroup: Int {
    case thunderstorm = 2
    case drizzle = 3
    case rain = 5
    case snow = 6
    case atmosphere = 7
    case clear = 800
    case fewClouds = 801
    case scatteredClouds = 802
    case brokenClouds = 803
    case overcastClouds = 804
    
    static func group(for id: Int) -> WeatherGroup? {
        let firstDigit = Int(String(id).prefix(1)) ?? 0
        let secondDigit = Int(String(id).prefix(3)) ?? 0
        switch firstDigit {
        case 2:
            return .thunderstorm
        case 3:
            return .drizzle
        case 5:
            return .rain
        case 6:
            return .snow
        case 7:
            return .atmosphere
        case 8:
            switch secondDigit {
            case 800:
                return .clear
            case 801:
                return .fewClouds
            case 802:
                return .scatteredClouds
            case 803:
                return .brokenClouds
            case 804:
                return .overcastClouds
            default:
                return nil
            }
        default:
            return nil
        }
    }
    
    var imageName: String {
        switch self {
        case .thunderstorm:
            return "thunderstorm"
        case .drizzle, .rain:
            return "rain"
        case .snow:
            return "snow"
        case .atmosphere:
            return "atmosphere"
        case .clear:
            return "clear"
        case .fewClouds:
            return "clouds"
        case .scatteredClouds:
            return "clouds"
        case .brokenClouds:
            return "clouds"
        case .overcastClouds:
            return "clouds"
        }
    }
}
