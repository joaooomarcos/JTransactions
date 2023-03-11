import Foundation

public protocol RequestServiceProtocol {
    func request<Model: Decodable>(_ request: Requestable, completion: @escaping (_ result: Result<Model, RequestError>) -> Void)
}

public final class RequestService: RequestServiceProtocol {
    
    // MARK: - Variables
    
    private var dataTask: URLSessionTask?
    private let environment: EnvironmentProtocol
    
    // MARK: - Init
    
    init(environment: EnvironmentProtocol) {
        self.environment = environment
    }
    
    // MARK: - Public
    
    public func request<Model: Decodable>(_ request: Requestable, completion: @escaping (_ result: Result<Model, RequestError>) -> Void) {
        
        guard var urlRequest = prepareRequest(request) else {
            completion(.failure(.urlError))
            return
        }
        
        urlRequest.httpMethod = request.method.rawValue
        
        dataTask = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let data = data else {
                completion(.failure(.custom(error?.localizedDescription ?? "")))
                return
            }
            
            guard !data.isEmpty else {
                completion(.failure(.emptyData))
                return
            }
            
            guard let self = self else {
                return
            }
            
            guard let model: Model = self.parse(response: data) else {
                completion(.failure(.parseError))
                return
            }
            
            completion(.success(model))
        }
        dataTask?.resume()
    }
    
    // MARK: - Privates
    
    internal func prepareRequest(_ request: Requestable) -> URLRequest? {
        guard let url = prepareURL(from: request.endpoint) else {
            return nil
        }
        
        return URLRequest(url: url)
    }
    
    internal func prepareURL(from endpoint: Endpoint) -> URL? {
        var base = endpoint.base
        
        if base.isEmpty {
            base = environment.baseURL
        }
        
        var urlComponents = URLComponents(string: base)
        var path = endpoint.path
        
        if !path.isEmpty {
            if !endpoint.path.hasPrefix("/") {
                path = "/" + path
            }
            urlComponents?.path = path
        }
        
        return urlComponents?.url
    }
    
    internal func parse<Model: Decodable>(response: Data) -> Model? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
            let model = try decoder.decode(Model.self, from: response)
            return model
        } catch {
            return nil
        }
    }
}
