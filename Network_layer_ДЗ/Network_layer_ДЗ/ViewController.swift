//
//  ViewController.swift
//  Network_layer_ДЗ
//
//  Created by Денис on 28.01.2024.
//

import UIKit

class YourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchUser(userID: 1) { result in
            switch result {
            case .success(let user):
                DatabaseManager.shared.saveUser(user)
            case .failure(let error):
                print("Error fetching user: \(error)")
            }
        }

        if let user = DatabaseManager.shared.getUserByID(1) {
            print("User: \(user)")
        } else {
            print("User not found in the database.")
        }
    }
}

