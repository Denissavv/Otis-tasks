//
//  ModelData.swift
//  Final-work-weather
//
//  Created by Денис on 21.02.2024.
//

import SwiftUI

//var previewWeather: ResponseBody

func loads <T: Decodable> (_ filename: String) -> T {

    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError ("Could't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError ("")
    }
    
    do {
        let decoder = JSONDecoder ()
        return try decoder.decode (T.self, from: data)
    } catch {
        fatalError ("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
