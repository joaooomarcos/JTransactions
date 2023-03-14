import UIKit

extension UIViewController {
    @discardableResult
    func showSimpleAlert(title: String,
                         message: String = "",
                         okTitle: String = "OK",
                         okCompletion: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
            okCompletion?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        return alertController
    }
}
