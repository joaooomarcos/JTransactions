import Foundation

struct Transaction: Decodable, Equatable {
    let name: String
    let type: TransactionType
    let date: Date
    let message: String?
    let amount: Amount
    let smallIcon: Icon
    let largeIcon: Icon
}
