import Foundation

final class TransactionDetailPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: TransactionDetailPresenterOutputProtocol?
    private let router: TransactionDetailRouterProtocol
    private let interactor: TransactionDetailInteractorInputProtocol
    private let model: TransactionCellViewModel
    
    private var actions: [DetailAction] = []
    
    // MARK: - Inits
    
    init(router: TransactionDetailRouterProtocol,
         interactor: TransactionDetailInteractorInputProtocol,
         model: TransactionCellViewModel) {
        self.router = router
        self.interactor = interactor
        self.model = model
        prepareActions()
    }
    
    func prepareActions() {
        let category = DetailAction.category(bgColor: model.backgroundColor,
                                             borderColor: model.borderColor,
                                             icon: model.smallIcon,
                                             iconURL: model.smallIconURL)
        actions = [category,
                   .like,
                   .problem,
                   .split]
    }
}

// MARK: - Input Protocol
extension TransactionDetailPresenter: TransactionDetailPresenterInputProtocol {
    func viewDidLoad() {
        viewController?.fill(model: model)
    }
    
    var numberOfRows: Int {
        actions.count
    }
    
    func actionForCell(at indexPath: IndexPath) -> DetailAction {
        actions[indexPath.row]
    }
}

// MARK: - Output Protocol
extension TransactionDetailPresenter: TransactionDetailInteractorOutputProtocol {
    
}
