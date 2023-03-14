import Foundation

final class TransactionDetailPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: TransactionDetailPresenterOutputProtocol?
    private let router: TransactionDetailRouterProtocol
    private let interactor: TransactionDetailInteractorInputProtocol
    
    // MARK: - Inits
    
    init(router: TransactionDetailRouterProtocol,
         interactor: TransactionDetailInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - Input Protocol
extension TransactionDetailPresenter: TransactionDetailPresenterInputProtocol {
    
}

// MARK: - Output Protocol
extension TransactionDetailPresenter: TransactionDetailInteractorOutputProtocol {
    
}
