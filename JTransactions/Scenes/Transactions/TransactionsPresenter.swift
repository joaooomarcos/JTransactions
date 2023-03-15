import Foundation

final class TransactionsPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: TransactionsPresenterOutputProtocol?
    private let router: TransactionsRouterProtocol
    private let interactor: TransactionsInteractorInputProtocol
    
    // MARK: - Private Properties
    
    private var transactions: [TransactionsGrouped] = []
    
    // MARK: - Inits
    
    init(router: TransactionsRouterProtocol,
         interactor: TransactionsInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - Input Protocol
extension TransactionsPresenter: TransactionsPresenterInputProtocol {
    func viewWillAppear() {
        interactor.fetchData()
        viewController?.showLoading()
    }
    
    var numberOfSections: Int {
        transactions.count
    }
    
    func titleFor(section: Int) -> String {
        transactions[section].date.toString(with: "MMMM")
    }
    
    func numberOfRows(in section: Int) -> Int {
        transactions[section].transactions.count
    }
    
    func modelForCell(at indexPath: IndexPath) -> TransactionPresentationModel {
        return transactions[indexPath.section].transactions.compactMap({
            TransactionPresentationModel(with: $0)
        })[indexPath.row]
    }
    
    func didTapOnCell(at indexPath: IndexPath) {
        if modelForCell(at: indexPath).largeIconURL == nil {
            viewController?.updateScaleTransition(with: 2.0)
        } else {
            viewController?.updateScaleTransition(with: 1.0)
        }
        
        router.showDetail(for: TransactionPresentationModel(with: transactions[indexPath.section].transactions[indexPath.row]))
    }
}

// MARK: - Output Protocol
extension TransactionsPresenter: TransactionsInteractorOutputProtocol {
    func fetchSucceded(models: [TransactionsGrouped]) {
        transactions = models
        
        DispatchQueue.main.safeAsync({ [weak self] in
            self?.viewController?.removeStates()
            if self?.transactions.isEmpty ?? false {
                self?.viewController?.showEmptyState()
            } else {
                self?.viewController?.showData()
            }
        })
    }
    
    func fetchFailed(error: RequestError) {
        DispatchQueue.main.safeAsync({ [weak self] in
            self?.viewController?.removeStates()
            self?.viewController?.showEmptyState()
            self?.viewController?.showError(title: "Erreur",
                                            message: "Nous avons eu un problème")
        })
    }
}
