import Foundation

final class TransactionDetailInteractor {
    
    // MARK: - VIPER Properties

    weak var output: TransactionDetailInteractorOutputProtocol?

    // MARK: - Inits
    
    init() {
        
    }
}

// MARK: - Input Protocol
extension TransactionDetailInteractor: TransactionDetailInteractorInputProtocol {

}
