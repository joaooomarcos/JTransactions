import Foundation
@testable import JTransactions

extension Transaction {
    static var mock: Transaction {
        Transaction(name: "",
                    type: .meal_voucher,
                    date: .now,
                    message: nil,
                    amount: .init(value: 0.0,
                                  currency: .init(iso3: "",
                                                  symbol: "",
                                                  title: "")),
                    smallIcon: .init(url: nil,
                                     category: .meal_voucher),
                    largeIcon: .init(url: nil, category: .meal_voucher))
    }
}
