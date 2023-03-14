import Foundation
@testable import JTransactions

typealias TransactionsPresenterInputProtocolDummy = TransactionsPresenterInputProtocolSpy

final class TransactionsPresenterInputProtocolSpy: TransactionsPresenterInputProtocol {
    
    enum Methods: Equatable {
        case viewWillAppear
        case modelForCell
        case didTapOnCell(at: IndexPath)
    }

    private(set) var calledMethods = [Methods]()
    
    func viewWillAppear() {
        calledMethods.append(.viewWillAppear)
    }
    
    var numberOfRowsToBeReturned: Int = 0
    
    var numberOfRows: Int {
        numberOfRowsToBeReturned
    }
    
    var modelToBeReturned: TransactionPresentationModel?
    
    func modelForCell(at indexPath: IndexPath) -> JTransactions.TransactionPresentationModel {
        calledMethods.append(.modelForCell)
        return modelToBeReturned ?? TransactionPresentationModel(with: .mock)
    }
    
    func didTapOnCell(at indexPath: IndexPath) {
        calledMethods.append(.didTapOnCell(at: indexPath))
    }
}
