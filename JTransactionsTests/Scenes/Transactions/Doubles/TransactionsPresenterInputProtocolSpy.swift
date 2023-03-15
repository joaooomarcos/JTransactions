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
    
    var numberOfSectionsToBeReturned: Int = 0
    var numberOfSections: Int {
        numberOfSectionsToBeReturned
    }
    
    var titleToBeReturned: String = ""
    func titleFor(section: Int) -> String {
        titleToBeReturned
    }
    
    var numberOfRowsToBeReturned: Int = 0
    func numberOfRows(in section: Int) -> Int {
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
