import UIKit

final class TransactionTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    private lazy var largeIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.addCornerRadius(24.0)
        return imageView
    }()
    
    private lazy var smallIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.addCornerRadius(11.0)
        imageView.addBorder(with: .white, width: 3.0)
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private lazy var textsView: UIView = UIView()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .catalog(.grey900)
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        return label
    }()
    
    private lazy var dateAndMessagelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .catalog(.grey700)
        label.font = .systemFont(ofSize: 12.0)
        return label
    }()
    
    private lazy var amountView: UIView = {
        let view = UIView()
        view.addCornerRadius(9.0)
        return view
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        return label
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Fill
    
    func fill(model: TransactionCellViewModel) {
        nameLabel.text = model.name
        dateAndMessagelLabel.text = model.dateAndMessage
        amountLabel.text = model.value
        formatAmount(isNegative: model.isNegative)
        
        largeIconImageView.backgroundColor = model.backgroundColor
        largeIconImageView.addBorder(with: model.borderColor, width: 1.0)
        
        largeIconImageView.image = model.largeIcon
        smallIconImageView.image = model.smallIcon
        
        if let largeURL = model.largeIconURL {
            largeIconImageView.image(from: largeURL)
            largeIconImageView.backgroundColor = .clear
        }
        
        if let smallURL = model.smallIconURL {
            smallIconImageView.image(from: smallURL)
            smallIconImageView.backgroundColor = .clear
        }
    }
    
    // MARK: - Privates
    
    private func formatAmount(isNegative: Bool) {
        if isNegative {
            amountView.backgroundColor = .clear
            amountLabel.textColor = .catalog(.grey900)
        } else {
            amountView.backgroundColor = .catalog(.primary300)
            amountLabel.textColor = .catalog(.primary500)
        }
    }
}

// MARK: - View Code
extension TransactionTableViewCell: ViewCode {
    func buildViewHierarchy() {
        amountView.addSubview(amountLabel)

        textsView.addSubviews(nameLabel,
                              amountView,
                              dateAndMessagelLabel)
        
        contentView.addSubviews(largeIconImageView,
                                smallIconImageView,
                                textsView)
    }
    
    func setupConstraints() {
        [largeIconImageView,
         smallIconImageView,
         nameLabel,
         amountView,
         amountLabel,
         dateAndMessagelLabel,
         textsView].prepareForViewCode()
        
        largeIconImageView.setConstraintsToSquare(with: 56.0)
        smallIconImageView.setConstraintsToSquare(with: 22.0)
        
        let margin: CGFloat = 20.0
        
        NSLayoutConstraint.activate([
            // Large Image View
            largeIconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            largeIconImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                                    constant: 12.0),
            largeIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                        constant: margin),

            // Small Image View
            smallIconImageView.leadingAnchor.constraint(equalTo: largeIconImageView.leadingAnchor, constant: 42.0),
            smallIconImageView.bottomAnchor.constraint(equalTo: largeIconImageView.bottomAnchor),

            // Texts View
            textsView.leadingAnchor.constraint(equalTo: largeIconImageView.trailingAnchor,
                                               constant: 16.0),
            textsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -margin),
            textsView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            textsView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,
                                           constant: 8.0),
            
            // Name Label
            nameLabel.leadingAnchor.constraint(equalTo: textsView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: textsView.topAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            // Amount Label
            amountLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            amountLabel.centerXAnchor.constraint(equalTo: amountView.centerXAnchor),
            amountLabel.heightAnchor.constraint(equalToConstant: 20.0),
            amountLabel.leadingAnchor.constraint(equalTo: amountView.leadingAnchor,
                                                 constant: 8.0),
            
            // Amount View
            amountView.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            amountView.heightAnchor.constraint(equalTo: amountLabel.heightAnchor,
                                               multiplier: 1.33),
            amountView.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor,
                                                constant: 8.0),
            amountView.trailingAnchor.constraint(equalTo: textsView.trailingAnchor),
            
            // Date and Message Label
            dateAndMessagelLabel.leadingAnchor.constraint(equalTo: textsView.leadingAnchor),
            dateAndMessagelLabel.trailingAnchor.constraint(equalTo: textsView.trailingAnchor),
            dateAndMessagelLabel.heightAnchor.constraint(equalToConstant: 16.0),
            dateAndMessagelLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,
                                                      constant: 2.0),
            dateAndMessagelLabel.bottomAnchor.constraint(equalTo: textsView.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        selectionStyle = .none
    }
}
