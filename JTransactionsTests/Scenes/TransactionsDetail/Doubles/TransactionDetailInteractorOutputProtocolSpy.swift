@testable import JTransactions

typealias TransactionDetailInteractorOutputProtocolDummy = TransactionDetailInteractorOutputProtocolSpy

final class TransactionDetailInteractorOutputProtocolSpy: TransactionDetailInteractorOutputProtocol {
    enum Methods: Equatable {
        
    }

    private(set) var calledMethods = [Methods]()
}
