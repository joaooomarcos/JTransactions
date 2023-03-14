import Foundation

final class TransactionsPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: TransactionsPresenterOutputProtocol?
    private let router: TransactionsRouterProtocol
    private let interactor: TransactionsInteractorInputProtocol
    
    // MARK: - Private Properties
    
    private var cells: [TransactionPresentationModel] = []
    private var transactions: [Transaction] = []
    
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
        viewController?.showLoading()
    }
    
    var numberOfRows: Int {
        cells.count
    }
    
    func modelForCell(at indexPath: IndexPath) -> TransactionPresentationModel {
        cells[indexPath.row]
    }
    
    func didTapOnCell(at indexPath: IndexPath) {
        router.showDetail(for: TransactionPresentationModel(with: transactions[indexPath.row]))
    }
}

// MARK: - Output Protocol
extension TransactionsPresenter: TransactionsInteractorOutputProtocol {
    func fetchSucceded(models: [Transaction]) {
        transactions = models
        cells = models.compactMap({
            TransactionPresentationModel(with: $0)
        })
                
        DispatchQueue.main.safeAsync({ [weak self] in
            self?.viewController?.removeStates()
            if self?.cells.isEmpty ?? false {
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
