//
//  TestStorage.swift
//  API
//
//  Created by Денис on 11.02.2024.
//

import Foundation


struct TestStorage: StorageService {
    func isLoaded() -> Bool {
        UserDefaults.standard.bool(forKey: "logged")
    }
    
    func setLogedIn() {
        UserDefaults.standard.setValue(true, forKey: "logged")
    }
}
