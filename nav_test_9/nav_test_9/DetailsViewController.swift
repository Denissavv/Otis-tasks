

import UIKit

class PostDetailsViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    var name: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = name {
            nameLabel.text = "Name: \(name)"
        }
        
        if let email = email {
            emailLabel.text = "Email: \(email)"
        }
    }
}
