import Foundation

// MARK: - ViewController
protocol TransactionDetailPresenterOutputProtocol: AnyObject {
    func fill(model: TransactionPresentationModel)
}

// MARK: - Presenter
protocol TransactionDetailPresenterInputProtocol: AnyObject {
    func viewDidLoad()
    var numberOfRows: Int { get }
    func actionForCell(at indexPath: IndexPath) -> DetailAction
}

// MARK: - Interactor
protocol TransactionDetailInteractorInputProtocol: AnyObject {
    
}

protocol TransactionDetailInteractorOutputProtocol: AnyObject {
    
}

// MARK: - Router
protocol TransactionDetailRouterProtocol: AnyObject {

}
