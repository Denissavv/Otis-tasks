//
//  ViewController.swift
//  DemoApp9
//
//  Created by Денис on 24.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    
    private lazy var customView: UIView = {
        let view = UIView(frame: CGRect(x: 50, y: 240, width: 100, height: 100))
        view.backgroundColor = .systemOrange
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }


}

private extension ViewController {
    func setupView(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(customView)
    }
}

