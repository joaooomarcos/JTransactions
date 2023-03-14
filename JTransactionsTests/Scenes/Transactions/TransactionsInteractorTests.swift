import XCTest
@testable import JTransactions

final class TransactionsInteractorTests: XCTestCase {
    
    func test_fetchData_success() {
        let (sut, doubles) = makeSUT()
        
        let mock = TransactionsResponse(transactions: [.mock, .mock])
        
        doubles.requestSpy.isResultSuccess = true
        doubles.requestSpy.modelToBeReturned = mock
        
        sut.fetchData()
        
        XCTAssertEqual(doubles.requestSpy.calledMethods, [.request])
        XCTAssertEqual(doubles.presenterSpy.calledMethods, [.fetchSucceded(models: mock.transactions)])
    }
    
    func test_fetchData_failure() {
        let (sut, doubles) = makeSUT()
        
        doubles.requestSpy.isResultSuccess = false
        
        sut.fetchData()
        
        XCTAssertEqual(doubles.requestSpy.calledMethods, [.request])
        XCTAssertEqual(doubles.presenterSpy.calledMethods, [.fetchFailed(error: .custom("teste"))])
    }
}

// MARK: - Helpers

private extension TransactionsInteractorTests {
    typealias SutAndDoubles = (
        sut: TransactionsInteractor,
        doubles:(presenterSpy: TransactionsInteractorOutputProtocolSpy,
                 requestSpy: RequestServiceSpy)
    )

    func makeSUT() -> SutAndDoubles {
        let presenterSpy = TransactionsInteractorOutputProtocolSpy()
        let requestSpy = RequestServiceSpy()
        let sut = TransactionsInteractor(requestService: requestSpy)
        sut.output = presenterSpy
        return (sut, (presenterSpy, requestSpy))
    }
}
