import UIKit

final class TransactionsRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension TransactionsRouter: TransactionsRouterProtocol {
    func showDetail(for transaction: TransactionPresentationModel) {
        let detailVC = TransactionDetailConfigurator().createModule(with: transaction)
        detailVC.modalPresentationStyle = .overFullScreen
        
        if let transactionsViewController = viewController as? TransactionsViewController {
            detailVC.transitioningDelegate = transactionsViewController
        }
        
        viewController?.present(detailVC, animated: true)
    }
}
