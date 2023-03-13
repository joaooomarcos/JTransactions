import UIKit

struct TransactionCellViewModel {
    let name: String
    let dateAndMessage: String
    let value: String
    let isNegative: Bool
    let smallIconURL: URL?
    let largeIconURL: URL?
    var smallIcon: UIImage?
    var largeIcon: UIImage?
    var largeIconBorderColor: UIColor = .clear
    var largeIconBackgroundColor: UIColor = .clear
    
    init(with transaction: Transaction) {
        var dateAndMessage = transaction.date.toString()
        
        if let message = transaction.message {
            dateAndMessage += "・\(message)"
        }
        
        self.isNegative = transaction.amount.value < 0
        
        let amountString = "\(transaction.amount.value.toString()) \(transaction.amount.currency.symbol)"
        
        if isNegative {
            value = amountString
        } else {
            value = "+ \(amountString)"
        }
        
        self.name = transaction.name
        self.dateAndMessage = dateAndMessage
        
        self.smallIconURL = transaction.smallIcon.url
        self.largeIconURL = transaction.largeIcon.url
        
        self.smallIcon = prepareSmallIcon(with: transaction.smallIcon.category)
        
        let large = prepareLargeIcon(with: transaction.largeIcon.category)
        self.largeIcon = large.image
        self.largeIconBackgroundColor = large.bgColor
        self.largeIconBorderColor = large.borderColor
    }
    
    func prepareSmallIcon(with category: Category) -> UIImage? {
        let image: UIImage?
        switch category {
        case .meal_voucher:
            image = UIImage(named: "Fork & knife")
        case .gift:
            image = UIImage(named: "Cagnotte")
        case .mobility:
            image = UIImage(named: "Bike")
        default:
            image = nil
        }
        return image
    }
    
    func prepareLargeIcon(with category: Category) -> (image: UIImage?,
                                                       bgColor: UIColor,
                                                       borderColor: UIColor) {
        let image: UIImage?
        let bgColor: UIColor
        let borderColor: UIColor
        
        switch category {
        case .sushi:
            image = UIImage(named: "icon-sushi")
            borderColor = .catalog(.orange100)
            bgColor = .catalog(.orange300)
        case .computer:
            image = UIImage(named: "icon-tech")
            borderColor = .catalog(.pink100)
            bgColor = .catalog(.pink300)
        case .train:
            image = UIImage(named: "icon-subway")
            borderColor = .catalog(.red100)
            bgColor = .catalog(.red300)
        case .burger:
            image = UIImage(named: "icon-burguer")
            borderColor = .catalog(.orange100)
            bgColor = .catalog(.orange300)
        case .bakery:
            image = UIImage(named: "icon-food")
            borderColor = .catalog(.orange100)
            bgColor = .catalog(.orange300)
        case .supermarket:
            image = UIImage(named: "icon-drink")
            borderColor = .catalog(.orange100)
            bgColor = .catalog(.orange300)
        default:
            image = nil
            borderColor = .catalog(.black100)
            bgColor = .catalog(.black100)
        }
        return (image: image, bgColor: bgColor, borderColor: borderColor)
    }
}
