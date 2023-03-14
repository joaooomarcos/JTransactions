@testable import JTransactions

typealias TransactionsInteractorInputProtocolDummy = TransactionsInteractorInputProtocolSpy

final class TransactionsInteractorInputProtocolSpy: TransactionsInteractorInputProtocol {
    
    enum Methods: Equatable {
        case fetchData
    }

    private(set) var calledMethods = [Methods]()
    
    func fetchData() {
        calledMethods.append(.fetchData)
    }
}
