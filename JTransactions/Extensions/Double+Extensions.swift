import Foundation

extension Double {
    func toString(digits: Int = 2) -> String {
        String(format: "%.\(digits)f", self)
    }
}
