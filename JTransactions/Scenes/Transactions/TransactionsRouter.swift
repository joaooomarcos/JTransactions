import UIKit

final class TransactionsRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension TransactionsRouter: TransactionsRouterProtocol {
    func showDetail() {
        // TODO
    }
}
