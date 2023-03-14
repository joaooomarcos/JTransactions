import UIKit

final class TransactionsViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: TransactionsPresenterInputProtocol
    
    // MARK: - UI Properties
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 80.0
        table.separatorStyle = .none
        table.register(TransactionTableViewCell.self)
        return table
    }()
    
    private lazy var emptyStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .catalog(.grey700)
        label.font = .systemFont(ofSize: 18.0)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Aucune information"
        return label
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.tintColor = .catalog(.grey900)
        return activity
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
        setupNavigationBar()
        setupView()
        presenter.viewDidLoad()
    }
    
    // MARK: - Privates
    
    private func setupNavigationBar() {
        title = "Titres-resto"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.catalog(.grey900)]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.catalog(.grey900)]

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapOnCell(at: indexPath)
    }
}

// MARK: - Presenter Output Protocol
extension TransactionsViewController: TransactionsPresenterOutputProtocol {
    func showData() {
        tableView.reloadData()
    }
    
    func showLoading() {
        activityIndicator.setCenter(in: view)
        activityIndicator.startAnimating()
    }
    
    func showError(title: String, message: String) {
        showSimpleAlert(title: title, message: message)
    }
    
    func showEmptyState() {
        view.addSubview(emptyStateLabel)
        emptyStateLabel.prepareForViewCode()
        
        NSLayoutConstraint.activate([
            emptyStateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                 constant: 60.0),
            emptyStateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                     constant: 20.0),
            emptyStateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -20.0),
        ])
    }
    
    func removeStates() {
        emptyStateLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
    }
}
