//
//  StartupInteractor.swift
//  API
//
//  Created by Денис on 11.02.2024.
//

import Foundation


class StartupInteractor {
    let storage: StorageService
    
    init(storage: StorageService) {
        self.storage = storage
    }
    
    func isLoaded()-> Bool {
        storage.isLoaded()
    }
    
}
