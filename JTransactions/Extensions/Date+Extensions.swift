import Foundation

extension Date {
    func toString(with format: String = "d MMM") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
