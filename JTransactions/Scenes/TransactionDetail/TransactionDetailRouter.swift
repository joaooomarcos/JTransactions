import UIKit

final class TransactionDetailRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension TransactionDetailRouter: TransactionDetailRouterProtocol {
    func dismiss() {
        viewController?.dismiss(animated: true)
    }
}
