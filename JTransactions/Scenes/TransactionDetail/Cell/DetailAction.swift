import UIKit

enum DetailAction {
    case category(bgColor: UIColor, borderColor: UIColor, icon: UIImage?, iconURL: URL?)
    case split
    case like
    case problem
    
    var iconURL: URL? {
        switch self {
        case .category(_, _, _, let url):
            return url
        default:
            return nil
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .category(_, _, let icon, _):
            return icon
        case .split:
            return UIImage(named: "icon-split")
        case .like:
            return UIImage(named: "icon-like")
        case .problem:
            return UIImage(named: "icon-problem")
        }
    }
    
    var title: String {
        switch self {
        case .category:
            return "Titres-resto"
        case .split:
            return "Partage d’addition"
        case .like:
            return "Aimer"
        case .problem:
            return "Signaler un problème"
        }
    }
    
    var info: String {
        switch self {
        case .category:
            return "Changer\nde compte"
        default:
            return ""
        }
    }
    
    var iconBackgroundColor: UIColor {
        switch self {
        case .category(let backgroundColor, _, _, _):
            return backgroundColor
        default:
            return .catalog(.grey100)
        }
    }
    
    var iconBorderColor: UIColor {
        switch self {
        case .category(_, let borderColor, _, _):
            return borderColor
        default:
            return .catalog(.grey300)
        }
    }
}
