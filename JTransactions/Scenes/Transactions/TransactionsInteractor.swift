import Foundation

final class TransactionsInteractor {
    
    // MARK: - VIPER Properties

    weak var output: TransactionsInteractorOutputProtocol?
    
    // MARK: - Private Properties
    
    private let requestService: RequestServiceProtocol

    // MARK: - Init
    
    init(requestService: RequestServiceProtocol) {
        self.requestService = requestService
    }
}

// MARK: - Input Protocol
extension TransactionsInteractor: TransactionsInteractorInputProtocol {
    func fetchData() {
        let requestable = TransactionsRequestable()
        
        requestService.request(requestable) { [weak self] (result: Result<TransactionsResponse, RequestError>) in
            switch result {
            case .success(let response):
                self?.output?.fetchSucceded(models: response.transactions)
            case .failure(let error):
                self?.output?.fetchFailed(error: error)
            }
        }
    }
}
