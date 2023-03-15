import Foundation
@testable import JTransactions

typealias TransactionsPresenterOutputProtocolDummy = TransactionsPresenterOutputProtocolSpy

final class TransactionsPresenterOutputProtocolSpy: TransactionsPresenterOutputProtocol {
    
    enum Methods: Equatable {
        case showData
        case showLoading
        case showEmptyState
        case showError(title: String, message: String)
        case removeStates
        case updateScaleTransition(with: CGFloat)
    }

    private(set) var calledMethods = [Methods]()
    
    func showData() {
        calledMethods.append(.showData)
    }
    
    func showLoading() {
        calledMethods.append(.showLoading)
    }
    
    func showEmptyState() {
        calledMethods.append(.showEmptyState)
    }
    
    func showError(title: String, message: String) {
        calledMethods.append(.showError(title: title,
                                        message: message))
    }
    
    func removeStates() {
        calledMethods.append(.removeStates)
    }
    
    func updateScaleTransition(with value: CGFloat) {
        calledMethods.append(.updateScaleTransition(with: value))
    }
}
