import Foundation

final class TransactionDetailPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: TransactionDetailPresenterOutputProtocol?
    private let router: TransactionDetailRouterProtocol
    private let interactor: TransactionDetailInteractorInputProtocol
    private let model: TransactionPresentationModel
    
    private var actions: [DetailAction] = []
    
    // MARK: - Inits
    
    init(router: TransactionDetailRouterProtocol,
         interactor: TransactionDetailInteractorInputProtocol,
         model: TransactionPresentationModel) {
        self.router = router
        self.interactor = interactor
        self.model = model
        prepareActions()
    }
    
    // MARK: - Privates
    
    private func prepareActions() {
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
    
    func didTapOnClose() {
        router.dismiss()
    }
}

// MARK: - Output Protocol
extension TransactionDetailPresenter: TransactionDetailInteractorOutputProtocol {
    
}
