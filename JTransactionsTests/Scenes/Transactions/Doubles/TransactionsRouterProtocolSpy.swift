@testable import JTransactions

typealias TransactionsRouterProtocolDummy = TransactionsRouterProtocolSpy

final class TransactionsRouterProtocolSpy: TransactionsRouterProtocol {
    
    enum Methods: Equatable {
        case showDetail(transaction: JTransactions.TransactionPresentationModel)
    }

    private(set) var calledMethods = [Methods]()
    
    func showDetail(for transaction: JTransactions.TransactionPresentationModel) {
        calledMethods.append(.showDetail(transaction: transaction))
    }
}
