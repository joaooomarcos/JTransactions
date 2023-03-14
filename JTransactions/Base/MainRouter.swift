import Foundation
import UIKit

// MARK: - Protocol

protocol MainRouterProtocol {
    func showInitialViewController()
}

// MARK: - Implementation

final class MainRouter: MainRouterProtocol {
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    private let environment: Environment
    private lazy var requestService: RequestService = {
        RequestService(environment: environment)
    }()
    
    // MARK: - Init

    init(window: UIWindow?,
         environment: Environment = Environment()) {
        self.window = window
        self.environment = environment
    }
    
    // MARK: - Scenes
    
    func showInitialViewController() {
        let transactionsVC = TransactionsConfigurator(requestService: requestService,
                                                      mainRouter: self)
            .createModule()
        let navigationController = UINavigationController(rootViewController: transactionsVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
