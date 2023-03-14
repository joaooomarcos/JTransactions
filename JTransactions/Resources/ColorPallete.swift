import UIKit

enum ColorPallete: String {
    case primary500 = "#633FD3"
    case primary300 = "#E6E0F8"
    case grey900 = "#1D1148"
    case grey700 = "#918BA6"
    case grey100 = "#F6F6F8"
    case grey300 = "#EEEDF1"
    case orange300 = "#FFEBD4"
    case orange100 = "#FD9B280F"
    case red300 = "#FEE0E1"
    case red100 = "#FC636B0F"
    case pink300 = "#FEE0F0"
    case pink100 = "#FC63B60F"
    case black100 = "#0000000F"
}

extension UIColor {
    static func catalog(_ colors: ColorPallete) -> UIColor {
        return UIColor(hex: colors.rawValue) ?? .white
    }
}
