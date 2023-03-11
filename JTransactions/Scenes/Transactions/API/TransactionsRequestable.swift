import Foundation

final class TransactionsRequestable: Requestable {
    var endpoint: Endpoint {
        .init(path: "Aurazion/365d587f5917d1478bf03bacabdc69f3/raw/3c92b70e1dc808c8be822698f1cbff6c95ba3ad3/transactions.json")
    }
}
