//
//  Router.swift
//  API
//
//  Created by Денис on 10.02.2024.
//

import Foundation


protocol Router: AnyObject {
    var parent: Router? {get set}
    var child: [Router] {get set}
}
