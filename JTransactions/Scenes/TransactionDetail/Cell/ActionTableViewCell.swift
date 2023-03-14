import UIKit

final class ActionTableViewCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    private lazy var iconImageView: UIImageView = UIImageView()
    private lazy var iconBackgroundView: UIView = UIView()
    private lazy var actionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.textColor = .catalog(.grey900)
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .medium)
        label.textColor = .catalog(.primary500)
        label.textAlignment = .right
        label.numberOfLines = 2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func fill(with action: DetailAction) {
        actionLabel.text = action.title
        infoLabel.text = action.info
        iconImageView.image = action.icon
        
        if let url = action.iconURL {
            iconImageView.image(from: url)
        }
        
        iconBackgroundView.backgroundColor = action.iconBackgroundColor
        iconBackgroundView.addBorder(with: action.iconBorderColor)
        iconBackgroundView.addCornerRadius(12.0)
        iconImageView.addCornerRadius(10.0)
    }
}

extension ActionTableViewCell: ViewCode {
    func buildViewHierarchy() {
        iconBackgroundView.addSubview(iconImageView)
        
        contentView.addSubviews(iconBackgroundView,
                                actionLabel,
                                infoLabel)
    }
    
    func setupConstraints() {
        [
            iconImageView,
            iconBackgroundView,
            actionLabel,
            infoLabel
        ].prepareForViewCode()
        
        iconBackgroundView.setConstraintsToSquare(with: 32.0)
        iconImageView.setConstraintsToSquare(with: 20.0)
        
        NSLayoutConstraint.activate([
            iconBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconBackgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            iconImageView.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor),
            
            actionLabel.leadingAnchor.constraint(equalTo: iconBackgroundView.trailingAnchor,
                                                 constant: 12.0),
            actionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            actionLabel.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor,
                                                  constant: 8.0),
            
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 56.0)
        ])
    }
    
    func setupAdditionalConfiguration() {
        selectionStyle = .none
    }
}
