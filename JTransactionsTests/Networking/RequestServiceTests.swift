import XCTest
@testable import JTransactions

final class RequestServiceTests: XCTestCase {

    var sut: RequestService = RequestService(environment: EnvironmentMock())
    
    func test_prepareRequest() throws {
        let requestModel = RequestableFake(endpoint: .init(path: "teste"))
        let sutRequest = sut.prepareRequest(requestModel)
        
        let url = try XCTUnwrap(URL(string: "https://www.google.com/teste"))
        let urlRequest = URLRequest(url: url)
        
        XCTAssertEqual(urlRequest, sutRequest)
    }
    
    func test_prepareURL_with_slash() {
        let endpoint = Endpoint(base: "https://www.google.com", path: "/teste")
        let url = sut.prepareURL(from: endpoint)
        
        XCTAssertEqual(url?.absoluteString, "https://www.google.com/teste")
    }
    
    func test_prepareURL_without_slash() {
        let endpoint = Endpoint(base: "https://www.google.com", path: "teste")
        let url = sut.prepareURL(from: endpoint)
        
        XCTAssertEqual(url?.absoluteString, "https://www.google.com/teste")
    }
    
    func test_prepareURL_without_base() {
        let endpoint = Endpoint(path: "teste")
        let url = sut.prepareURL(from: endpoint)
        
        XCTAssertEqual(url?.absoluteString, "https://www.google.com/teste")
    }
    
    func test_parse_success() throws {
        let bundle = Bundle(for: type(of: self))
        
        let url = try XCTUnwrap(bundle.url(forResource: "ResponseSuccess",
                                           withExtension: "json"))
        
        let data = try Data(contentsOf: url)
        let model: ResponseModel? = sut.parse(response: data)
        
        XCTAssertEqual(model?.title, "Teste")
    }
    
    func test_parse_failure() throws {
        let bundle = Bundle(for: type(of: self))
        
        let url = try XCTUnwrap(bundle.url(forResource: "ResponseSuccess",
                                           withExtension: "json"))
        
        let data = try Data(contentsOf: url)
        let model: ResponseIncorrectModel? = sut.parse(response: data)
        
        XCTAssertNil(model)
    }
    
    func test_request_success() throws {
        let expectation = XCTestExpectation(description: #function)
        var responseModel: ResponseModel?
        let bundle = Bundle(for: type(of: self))
        
        let url = try XCTUnwrap(bundle.url(forResource: "ResponseSuccess",
                                           withExtension: "json"))
        
        let requestable = RequestableFake(endpoint: .init(base: url.absoluteString))
        
        sut.request(requestable) { (result: Result<ResponseModel, RequestError>) in
            switch result {
            case .success(let model):
                responseModel = model
            case .failure:
                XCTFail("Expected success request")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.1)
        
        XCTAssertNotNil(responseModel)
        XCTAssertEqual(responseModel?.title, "Teste")
    }
    
    func test_request_empty() throws {
        let expectation = XCTestExpectation(description: #function)
        var errorModel: RequestError?
        let bundle = Bundle(for: type(of: self))
        
        let url = try XCTUnwrap(bundle.url(forResource: "ResponseEmpty",
                                           withExtension: "json"))
        
        let requestable = RequestableFake(endpoint: .init(base: url.absoluteString))
        
        sut.request(requestable) { (result: Result<ResponseModel, RequestError>) in
            switch result {
            case .success:
                XCTFail("Expected fail request")
            case .failure(let error):
                errorModel = error
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.1)
        
        XCTAssertNotNil(errorModel)
        XCTAssertEqual(errorModel, .emptyData)
    }
    
    func test_request_error_parse() throws {
        let expectation = XCTestExpectation(description: #function)
        var errorModel: RequestError?
        let bundle = Bundle(for: type(of: self))
        
        let url = try XCTUnwrap(bundle.url(forResource: "ResponseSuccess",
                                           withExtension: "json"))
        
        let requestable = RequestableFake(endpoint: .init(base: url.absoluteString))
        
        sut.request(requestable) { (result: Result<ResponseIncorrectModel, RequestError>) in
            switch result {
            case .success:
                XCTFail("Expected fail request")
            case .failure(let error):
                errorModel = error
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(errorModel, .parseError)
    }
    
    // Models
    
    struct ResponseModel: Decodable {
        var title: String
    }

    struct ResponseIncorrectModel: Decodable {
        var titles: String
    }
}
