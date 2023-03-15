import Foundation

extension Date {
    func toString(with format: String = "d MMMM") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
