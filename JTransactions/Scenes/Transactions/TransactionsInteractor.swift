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
    
    func groupedByDate(response: TransactionsResponse) -> [TransactionsGrouped] {
        let grouped = groupedDictionary(transactions: response.transactions)
        
        return grouped.keys.compactMap({
            TransactionsGrouped(date: $0, transactions: grouped[$0] ?? [])
        }).sorted(by: { $0.date > $1.date })
    }
    
    func groupedDictionary(transactions: [Transaction]) -> [Date: [Transaction]] {
        let empty: [Date: [Transaction]] = [:]
        return transactions.reduce(into: empty) { result, transaction in
            let components = Calendar.current.dateComponents([.year, .month],
                                                             from: transaction.date)
            if let date = Calendar.current.date(from: components) {
                let existing = result[date] ?? []
                result[date] = existing + [transaction]
            }
        }
    }
}

// MARK: - Input Protocol
extension TransactionsInteractor: TransactionsInteractorInputProtocol {
    func fetchData() {
        let requestable = TransactionsRequestable()
        
        requestService.request(requestable) { [weak self] (result: Result<TransactionsResponse, RequestError>) in
            switch result {
            case .success(let response):
                self?.output?.fetchSucceded(models: self?.groupedByDate(response: response) ?? [])
            case .failure(let error):
                self?.output?.fetchFailed(error: error)
            }
        }
    }
}
