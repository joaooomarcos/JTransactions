import XCTest
@testable import JTransactions

final class TransactionsInteractorTests: XCTestCase {
    
    func test_fetchData_success() throws {
        let (sut, doubles) = makeSUT()
        
        let mock1 = Transaction.mock
        let mock2 = Transaction.mock
        
        let mock = TransactionsResponse(transactions: [mock1, mock2])
        
        let components = Calendar.current.dateComponents([.year, .month],
                                                         from: mock1.date)
        let date = try XCTUnwrap(Calendar.current.date(from: components))
        let grouped = TransactionsGrouped(date: date, transactions: [mock1, mock2])
        
        doubles.requestSpy.isResultSuccess = true
        doubles.requestSpy.modelToBeReturned = mock
        
        sut.fetchData()
        
        XCTAssertEqual(doubles.requestSpy.calledMethods, [.request])
        XCTAssertEqual(doubles.presenterSpy.calledMethods, [.fetchSucceded(models: [grouped])])
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
