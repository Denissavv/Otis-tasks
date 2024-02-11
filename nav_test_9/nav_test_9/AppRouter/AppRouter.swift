//
//  AppRouter.swift
//  API
//
//  Created by Денис on 10.02.2024.
//

import Foundation
import UIKit


class AppRouter: NSObject, Router {
    
    var parent: Router? = nil
    var child: [Router] = []
    var uiWindow: UIWindow? = nil
    
    private let navController: UINavigationController
    
    init (controller: UINavigationController = UINavigationController()){
        navController = controller
    }
    
    func initScreen(scene: UIWindowScene){
        uiWindow = UIWindow(windowScene: scene)
    }
    
    
    func start() {
        navController.delegate = self
        uiWindow?.rootViewController = navController
        let startapRouter = StartapRouter(navController:navController, parent: self)
        startapRouter.start()
        
        uiWindow?.makeKeyAndVisible()
                child.append(startapRouter)
    }
}
    
    extension AppRouter: UINavigationControllerDelegate {
        func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController,
                                  animated: Bool) {
            guard let fromViewController = navigationController.transitionCoordinator?.viewController (forKey: .from) ,
                  !navigationController.viewControllers.contains(fromViewController)else{
                return
            }
            if let viewController = fromViewController as? Routable{
                let parent = viewController.router?.parent
                parent?.child.removeAll{$0 === viewController.router}
            }
        }
    }
    
