//
//  StoryBoardAndViewController.swift
//  API
//
//  Created by Денис on 10.02.2024.
//

import Foundation
import UIKit


enum StoryBoard: String {
    case main = "Main"
    
    static var defaultStoryboard: UIStoryboard {
        return UIStoryboard (name: StoryBoard.main.rawValue, bundle: nil)
    }
}


extension UIStoryboard {
    func buildController<T>(controllerName: String = String(describing: T.self)) -> T{
        return instantiateViewController (withIdentifier: controllerName) as! T
    }
}
