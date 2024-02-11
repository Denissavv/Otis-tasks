//
//  Router.swift
//  API
//
//  Created by Денис on 11.02.2024.
//

import Foundation
import UIKit


class LoginRouter: Router {
    var parent: Router? = nil
    var child: [Router] = []
    
    private let navController: UINavigationController
    
    init(navController: UINavigationController, parent: Router? = nil) {
        
        self.navController = navController
        self.parent = parent
    }
    func start(){
        let controller: ViewController = StoryBoard.defaultStoryboard.buildController(controllerName: "ViewController")
        controller.router = self
        navController.pushViewController(controller, animated: true)
    }
}

