import XCTest
@testable import JTransactions

final class TransactionDetailViewControllerTests: XCTestCase {

    func test_didTapCloseButton() {
        let (sut, presenterSpy) = makeSUT()
        
        sut.didTapCloseButton()
        
        XCTAssertEqual(presenterSpy.calledMethods, [.didTapOnClose])
    }
    
    func test_tableViewNumberOfRows() throws {
        let (sut, presenterSpy) = makeSUT()
        
        let table = try XCTUnwrap(sut.view.subviews.first(where: { $0 is UITableView }) as? UITableView)
        
        let numberOfRows = 10
        presenterSpy.numberOfRowsToBeReturned = numberOfRows
        sut.tableView(table, numberOfRowsInSection: numberOfRows)
        table.numberOfRows(inSection: 0)
        
        XCTAssertEqual(table.numberOfRows(inSection: 0), numberOfRows)
    }
    
    
}

// MARK: - Helpers

private extension TransactionDetailViewControllerTests {
    typealias SutAndDoubles = (
        sut: TransactionDetailViewController,
        presenterSpy: TransactionDetailPresenterInputProtocolSpy
    )

    func makeSUT() -> SutAndDoubles {
        let presenterSpy = TransactionDetailPresenterInputProtocolSpy()
        let sut = TransactionDetailViewController(presenter: presenterSpy)
        return (sut, presenterSpy)
    }
}
