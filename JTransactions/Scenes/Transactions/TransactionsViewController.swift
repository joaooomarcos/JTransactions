import UIKit

final class TransactionsViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: TransactionsPresenterInputProtocol
    
    // MARK: - UI Properties
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 80.0
        table.separatorStyle = .none
        table.register(TransactionTableViewCell.self)
        return table
    }()

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
        setupView()
        presenter.viewDidLoad()
    }
}

extension TransactionsViewController: ViewCode {
    func buildViewHierarchy() {
        view.backgroundColor = .systemBackground
        tableView.pinToBounds(of: view)
    }
}

// MARK: - Table View
extension TransactionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TransactionTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let model = presenter.modelForCell(at: indexPath)
        cell.fill(model: model)
        return cell
    }
}

// MARK: - Presenter Output Protocol
extension TransactionsViewController: TransactionsPresenterOutputProtocol {
    func showData() {
        tableView.reloadData()
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
