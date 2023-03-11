import Foundation

final class TransactionsPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: TransactionsPresenterOutputProtocol?
    private let router: TransactionsRouterProtocol
    private let interactor: TransactionsInteractorInputProtocol
    
    // MARK: - Inits
    
    init(router: TransactionsRouterProtocol,
         interactor: TransactionsInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - Input Protocol
extension TransactionsPresenter: TransactionsPresenterInputProtocol {
    func viewDidLoad() {
        interactor.fetchData()
    }
}

// MARK: - Output Protocol
extension TransactionsPresenter: TransactionsInteractorOutputProtocol {
    func fetchSucceded(models: [Transaction]) {
        print(models)
    }
    
    func fetchFailed(error: RequestError) {
        viewController?.showError(title: "Error",
                                  message: "Try again later")
    }
}
