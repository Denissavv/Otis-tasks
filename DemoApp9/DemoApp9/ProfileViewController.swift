
import UIKit

final class ProfileViewController: UIViewController {
    
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 16,
            y: 59,
            width: 395,
            height: 361
        ))
        imageView.backgroundColor = .systemOrange
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private lazy var cameraButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 330,
            y: 335,
            width: 80,
            height: 80
        ))
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 40
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        
        let name = UILabel(frame: CGRect(
            x: 16,
            y: 428,
            width: 361,
            height: 35
        ))
        name.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        name.text = "SAVCHENKO DENIS"
        return name
    }()
    
    private lazy var descriptionLabel: UILabel = {
        
        let descriptiop = UILabel(frame: CGRect(
            x: 16,
            y: 471,
            width: 361,
            height: 35
        ))
        descriptiop.font = UIFont.systemFont(ofSize: 18)
        descriptiop.text =  "APP DEVELOPER"
        return descriptiop
    }()
    
    
    private lazy var addressLabel: UILabel = {
        
        let descriptiop = UILabel(frame: CGRect(
            x: 16,
            y: 514,
            width: 361,
            height: 35
        ))
        descriptiop.font = UIFont.systemFont(ofSize: 18)
        descriptiop.text =  "Russia, Moscow"
        return descriptiop
    }()
    
    private lazy var copyButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 16,
            y: 557,
            width: 80,
            height: 40
        ))
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.setTitle("Copy", for: .normal)
        button.addTarget(self, action: #selector(didTapCopyButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .systemBackground
        view.addSubview(avatarImageView)
        view.addSubview(cameraButton)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(addressLabel)
        view.addSubview(copyButton)
        
    }
    
    @objc private func didTapButton(){
        nameLabel.text = nameLabel.text == "DENIS" ? "SAVCHENKO DENIS" : "DENIS"
    }
    
    @objc private func didTapCopyButton() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = addressLabel.text
        // Optionally, you can provide user feedback that the address is copied, for example, show an alert.
        // You can customize this feedback based on your app's UI/UX.
        let alert = UIAlertController(title: "Address Copied", message: "The address has been copied to the clipboard.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
