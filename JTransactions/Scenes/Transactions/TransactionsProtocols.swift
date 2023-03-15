import Foundation

// MARK: - ViewController
protocol TransactionsPresenterOutputProtocol: AnyObject {
    func showData()
    func showLoading()
    func showEmptyState()
    func showError(title: String, message: String)
    func removeStates()
    func updateScaleTransition(with value: CGFloat)
}

// MARK: - Presenter
protocol TransactionsPresenterInputProtocol: AnyObject {
    func viewWillAppear()
    var numberOfSections: Int { get }
    func titleFor(section: Int) -> String
    func numberOfRows(in section: Int) -> Int
    func modelForCell(at indexPath: IndexPath) -> TransactionPresentationModel
    func didTapOnCell(at indexPath: IndexPath)
}

// MARK: - Interactor
protocol TransactionsInteractorInputProtocol: AnyObject {
    func fetchData()
}

protocol TransactionsInteractorOutputProtocol: AnyObject {
    func fetchSucceded(models: [TransactionsGrouped])
    func fetchFailed(error: RequestError)
}

// MARK: - Router
protocol TransactionsRouterProtocol: AnyObject {
    func showDetail(for transaction: TransactionPresentationModel)
}
