//
//  StartapViewController.swift
//  API
//
//  Created by Денис on 10.02.2024.
//

import Foundation
import UIKit


class StartapViewController: UIViewController, Routable {
    
    var presenter: StartupPresenter?
    var router: Router?
    
    override func viewDidLoad ( ) {
    super.viewDidLoad ()
        
    AppConfigurator.shared.configure(controller: self)
                                       
    presenter?.checkIsLoaded()
    }

    private var startupRouter: StartapRouter? {
        return router as? StartapRouter
    }
    
    public func onCheckFinish(isLogged: Bool){
    if isLogged {
        startupRouter?.moveToLogin()
    } else {
        startupRouter?.moveToLogin()
    }
    }
}
