import UIKit

protocol TransactionDetailConfiguratorProtocol: AnyObject {
    func createModule(with model: TransactionDetailViewModel) -> UIViewController
}

final class TransactionDetailConfigurator: TransactionDetailConfiguratorProtocol {

    func createModule(with model: TransactionDetailViewModel) -> UIViewController {
        let router = TransactionDetailRouter()
        let interactor = TransactionDetailInteractor()
        let presenter = TransactionDetailPresenter(router: router,
                                                   interactor: interactor)
        interactor.output = presenter
        let viewController = TransactionDetailViewController(presenter: presenter,
                                                             model: model)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
