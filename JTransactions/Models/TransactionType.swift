import Foundation

enum TransactionType: String, Decodable {
    case donation
    case meal_voucher
    case gift
    case mobility
    case payment
}
