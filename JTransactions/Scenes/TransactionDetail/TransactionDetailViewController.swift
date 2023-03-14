import UIKit

final class TransactionDetailViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: TransactionDetailPresenterInputProtocol
    private let model: TransactionDetailViewModel
    
    // MARK: - UI Properties
    
    private lazy var statusBackgroundView: UIView = UIView()
    private lazy var headerView: UIView = UIView()
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        button.setImage(UIImage(named: "chevron-down"), for: .normal)
        return button
    }()
    
    private lazy var largeIconImageView: UIImageView = UIImageView()
    
    private lazy var smallIconBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(12.0)
        return view
    }()
    
    private lazy var smallIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.addCornerRadius(2.0)
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 6.0
        return stack
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34.0, weight: .bold)
        label.textColor = .catalog(.grey900)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.textColor = .catalog(.grey900)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .catalog(.grey700)
        return label
    }()
    
    // MARK: - Inits
    
    init(presenter: TransactionDetailPresenterInputProtocol,
         model: TransactionDetailViewModel) {
        self.presenter = presenter
        self.model = model
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
        fill()
    }
    
    func fill() {
        statusBackgroundView.backgroundColor = model.backgroundColor
        headerView.backgroundColor = model.backgroundColor
        largeIconImageView.image = model.largeIcon
        smallIconImageView.image = model.smallIcon
        
        if let url = model.largeIconURL {
            largeIconImageView.image(from: url)
        }
        
        if let url = model.smallIconURL {
            smallIconImageView.image(from: url)
        }
        
        valueLabel.text = model.value
        nameLabel.text = model.name
        dateLabel.text = model.date
    }
    
    // MARK: - Actions
    
    @objc
    func didTapCloseButton() {
        dismiss(animated: true)
    }
}

// MARK: - View Code
extension TransactionDetailViewController: ViewCode {
    func buildViewHierarchy() {
        headerView.addSubviews(closeButton,
                               largeIconImageView)
        smallIconBackgroundView.addSubview(smallIconImageView)
        
        titleStackView.addArrangedSubviews(valueLabel,
                                           nameLabel,
                                           dateLabel)
        
        view.addSubviews(statusBackgroundView,
                         headerView,
                         smallIconBackgroundView,
                         titleStackView)
    }
    
    func setupConstraints() {
        [
            statusBackgroundView,
            largeIconImageView,
            headerView,
            closeButton,
            smallIconImageView,
            smallIconBackgroundView,
            titleStackView
        ].prepareForViewCode()
        
        largeIconImageView.setConstraintsToSquare(with: 57.0)
        closeButton.setConstraintsToSquare(with: 40.0)
        smallIconImageView.setConstraintsToSquare(with: 18.0)
        smallIconBackgroundView.setConstraintsToSquare(with: 24.0)
        
        NSLayoutConstraint.activate([
            // Status Background
            statusBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            // Header View
            headerView.topAnchor.constraint(equalTo: statusBackgroundView.bottomAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: headerView.widthAnchor,
                                               multiplier: 0.55),
            
            // Icon
            largeIconImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            largeIconImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            // Close Button
            closeButton.topAnchor.constraint(equalTo: headerView.topAnchor),
            closeButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,
                                                 constant: 12.0),
            
            // Small Icon Background
            smallIconBackgroundView.centerYAnchor.constraint(equalTo: headerView.bottomAnchor),
            smallIconBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32.0),
            
            // Small Icon
            smallIconImageView.centerYAnchor.constraint(equalTo: smallIconBackgroundView.centerYAnchor),
            smallIconImageView.centerXAnchor.constraint(equalTo: smallIconBackgroundView.centerXAnchor),
            
            // Title stack
            titleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor,
                                                    constant: 20.0),
            titleStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24.0)
        ])
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}

// MARK: - Presenter Output Protocol
extension TransactionDetailViewController: TransactionDetailPresenterOutputProtocol {

}
