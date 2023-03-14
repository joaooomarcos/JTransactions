@testable import JTransactions

typealias TransactionsInteractorOutputProtocolDummy = TransactionsInteractorOutputProtocolSpy

final class TransactionsInteractorOutputProtocolSpy: TransactionsInteractorOutputProtocol {
    
    enum Methods: Equatable {
        case fetchSucceded(models: [JTransactions.Transaction])
        case fetchFailed(error: JTransactions.RequestError)
    }

    private(set) var calledMethods = [Methods]()
    
    func fetchSucceded(models: [JTransactions.Transaction]) {
        calledMethods.append(.fetchSucceded(models: models))
    }
    
    func fetchFailed(error: JTransactions.RequestError) {
        calledMethods.append(.fetchFailed(error: error))
    }
}
