import UIKit

final class TransactionsViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: TransactionsPresenterInputProtocol

    // MARK: - Inits
    
    init(presenter: TransactionsPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - Presenter Output Protocol
extension TransactionsViewController: TransactionsPresenterOutputProtocol {
    func showData() {
        // TODO
    }
    
    func showLoading() {
        // TODO
    }
    
    func showError(title: String, message: String) {
        // TODO
    }
    
    func removeStates() {
        // TODO
    }
}
