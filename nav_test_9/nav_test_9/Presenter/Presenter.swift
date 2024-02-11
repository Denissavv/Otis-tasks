//
//  Presenter.swift
//  API
//
//  Created by Денис on 11.02.2024.
//

import Foundation


class LoginPresenter {
    let controller: StartapViewController
    let interactor: StartupInteractor
    
    init (controller: StartapViewController, interactor: StartupInteractor) {
        self.controller = controller
        self.interactor = interactor
    }
    
    func checkIsLoaded () {
        let result = interactor.isLoaded()
         controller.onCheckFinish(isLogged: result)
    }
}
