import UIKit

protocol ViewCode: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func buildViewHierarchy() { }
    func setupConstraints() { }
    func setupAdditionalConfiguration() { }
    
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
    
    func pinToBounds(of view: UIView, with bounds: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: safeArea.topAnchor,
                                 constant: bounds.top),
            bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,
                                    constant: -bounds.bottom),
            leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                     constant: bounds.left),
            trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                      constant: -bounds.right),
        ])
    }
    
    func setConstraintsToSquare(with size: CGFloat) {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: size),
            heightAnchor.constraint(equalToConstant: size)
        ])
    }
}

extension Array where Element == UIView {
    func prepareForViewCode() {
        forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
    }
}
