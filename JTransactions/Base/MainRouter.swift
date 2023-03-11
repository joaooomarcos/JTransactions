import Foundation
import UIKit

protocol MainRouterProtocol {
    func showInitialViewController()
}

final class MainRouter: MainRouterProtocol {
    
    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }
    
    func showInitialViewController() {
        let viewController = UIViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
