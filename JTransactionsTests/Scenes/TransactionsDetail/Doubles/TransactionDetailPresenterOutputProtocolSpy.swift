@testable import JTransactions

typealias TransactionDetailPresenterOutputProtocolDummy = TransactionDetailPresenterOutputProtocolSpy

final class TransactionDetailPresenterOutputProtocolSpy: TransactionDetailPresenterOutputProtocol {
    enum Methods: Equatable {
        case fill(model: TransactionPresentationModel)
    }

    private(set) var calledMethods = [Methods]()
    
    func fill(model: TransactionPresentationModel) {
        calledMethods.append(.fill(model: model))
    }
}
