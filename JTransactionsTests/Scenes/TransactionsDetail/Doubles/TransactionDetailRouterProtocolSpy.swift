@testable import JTransactions

typealias TransactionDetailRouterProtocolDummy = TransactionDetailRouterProtocolSpy

final class TransactionDetailRouterProtocolSpy: TransactionDetailRouterProtocol {
    enum Methods: Equatable {
        case dismiss
    }

    private(set) var calledMethods = [Methods]()
    
    func dismiss() {
        calledMethods.append(.dismiss)
    }
}
