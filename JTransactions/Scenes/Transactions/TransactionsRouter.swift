import UIKit

final class TransactionsRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension TransactionsRouter: TransactionsRouterProtocol {
    func showDetail(for transaction: TransactionDetailViewModel) {
        let detailVC = TransactionDetailConfigurator().createModule(with: transaction)
        detailVC.modalPresentationStyle = .overFullScreen
        viewController?.present(detailVC, animated: true)
    }
}
