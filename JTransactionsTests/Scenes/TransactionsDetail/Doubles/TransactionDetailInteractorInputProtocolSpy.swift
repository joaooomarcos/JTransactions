@testable import JTransactions

typealias TransactionDetailInteractorInputProtocolDummy = TransactionDetailInteractorInputProtocolSpy

final class TransactionDetailInteractorInputProtocolSpy: TransactionDetailInteractorInputProtocol {
    enum Methods: Equatable {
        
    }

    private(set) var calledMethods = [Methods]()
}
