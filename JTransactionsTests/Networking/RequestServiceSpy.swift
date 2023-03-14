import Foundation
@testable import JTransactions

final class RequestServiceSpy: RequestServiceProtocol {
    enum Methods: Equatable {
        case request
    }

    private(set) var calledMethods = [Methods]()
    
    var modelToBeReturned: Decodable?
    var isResultSuccess: Bool = true
    
    func request<Model>(_ request: Requestable, completion: @escaping (Result<Model, RequestError>) -> Void) where Model : Decodable {
        calledMethods.append(.request)
        
        if isResultSuccess {
            guard let model = modelToBeReturned else {
                return
            }
            completion(.success(model as! Model))
        } else {
            completion(.failure(.custom("teste")))
        }
    }
}
