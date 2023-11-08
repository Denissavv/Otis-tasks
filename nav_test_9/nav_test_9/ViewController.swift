//
//  ViewController.swift
//  nav_test_9
//
//  Created by Денис on 07.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "DetailsSegueId",
            let detailViewController = segue.destination as? PostDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else {
                return
        }
        
        let selectedUserData = names[indexPath.row]
        detailViewController.name = selectedUserData.name
        detailViewController.email = selectedUserData.email
    }
    
    @IBOutlet var tableView: UITableView!
    
    
    struct userData  {
        let name: String;
        let email: String
    }
    
    let names: [userData] = [
        userData(name: "Denis", email: "example@gmail.com"),
        userData(name: "Kate", email: "e2@gmail.com"),
        userData(name: "Jhohn", email: "qwerty@gmail.com"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you taped me")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataCell = names[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! CustomTableViewCell
        
        cell.name.text = dataCell.name
        cell.email.text = dataCell.email
        
        return cell
    }
}
