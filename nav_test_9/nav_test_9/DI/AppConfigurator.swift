

import Foundation
import UIKit


class AppConfigurator {
    public static let shared = AppConfigurator ()
    private init() {}
    
    func configure (controller: UIViewController) {
        if let startupViewController = controller as? StartapViewController {
            let interactor = StartupInteractor (storage: TestStorage())
            let presenter = StartupPresenter (controller: startupViewController, interactor: interactor)
            startupViewController.presenter = presenter
        }
    }
}
