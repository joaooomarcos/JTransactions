import Foundation
@testable import JTransactions

typealias TransactionDetailPresenterInputProtocolDummy = TransactionDetailPresenterInputProtocolSpy

final class TransactionDetailPresenterInputProtocolSpy: TransactionDetailPresenterInputProtocol {
    
    enum Methods: Equatable {
        case viewDidLoad
        case actionForCell(indexPath: IndexPath)
        case didTapOnClose
    }

    private(set) var calledMethods = [Methods]()
    
    func viewDidLoad() {
        calledMethods.append(.viewDidLoad)
    }
    
    var numberOfRowsToBeReturned: Int = 0
    var numberOfRows: Int {
        numberOfRowsToBeReturned
    }
    
    var actionForCellToBeReturned: DetailAction = .problem
    func actionForCell(at indexPath: IndexPath) -> DetailAction {
        calledMethods.append(.actionForCell(indexPath: indexPath))
        return actionForCellToBeReturned
    }
    
    func didTapOnClose() {
        calledMethods.append(.didTapOnClose)
    }
}
