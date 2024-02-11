//
//  StartapRouter.swift
//  API
//
//  Created by Денис on 10.02.2024.
//

import Foundation
import UIKit

class StartapRouter: Router {
    var parent: Router? = nil
    var child: [Router] = []
    
    private let navController: UINavigationController
    
    init(navController: UINavigationController, parent: Router? = nil) {
    
        self.navController = navController
        self.parent = parent
    
    }
    
    func start(){
        let controller: StartapViewController = StoryBoard.defaultStoryboard.buildController()
        controller.router = self
        navController.pushViewController(controller, animated: true)
    }
    
    func moveToLogin() {
    let child = LoginRouter (navController: navController, parent: self)
    child.start()
    self.child.append(child)
    }
}
