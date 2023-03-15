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
    var numberOfRows: Int { get }
    func modelForCell(at indexPath: IndexPath) -> TransactionPresentationModel
    func didTapOnCell(at indexPath: IndexPath)
}

// MARK: - Interactor
protocol TransactionsInteractorInputProtocol: AnyObject {
    func fetchData()
}

protocol TransactionsInteractorOutputProtocol: AnyObject {
    func fetchSucceded(models: [Transaction])
    func fetchFailed(error: RequestError)
}

// MARK: - Router
protocol TransactionsRouterProtocol: AnyObject {
    func showDetail(for transaction: TransactionPresentationModel)
}
