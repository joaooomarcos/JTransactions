import UIKit

protocol TransactionsConfiguratorProtocol: AnyObject {
    func createModule() -> UIViewController
}

final class TransactionsConfigurator: TransactionsConfiguratorProtocol {
    
    // MARK: - Private Properties
    
    private let requestService: RequestServiceProtocol
    private let mainRouter: MainRouterProtocol
    
    // MARK: - Init

    init(requestService: RequestServiceProtocol,
         mainRouter: MainRouterProtocol) {
        self.requestService = requestService
        self.mainRouter = mainRouter
    }
    
    
    // MARK: - Module creation
    
    func createModule() -> UIViewController {
        let router = TransactionsRouter()
        let interactor = TransactionsInteractor(requestService: requestService)
        let presenter = TransactionsPresenter(router: router,
                                              interactor: interactor)
        interactor.output = presenter
        let viewController = TransactionsViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
