import UIKit

protocol TransactionDetailConfiguratorProtocol: AnyObject {
    func createModule(with model: TransactionCellViewModel) -> UIViewController
}

final class TransactionDetailConfigurator: TransactionDetailConfiguratorProtocol {

    func createModule(with model: TransactionCellViewModel) -> UIViewController {
        let router = TransactionDetailRouter()
        let interactor = TransactionDetailInteractor()
        let presenter = TransactionDetailPresenter(router: router,
                                                   interactor: interactor,
                                                   model: model)
        interactor.output = presenter
        let viewController = TransactionDetailViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
