import XCTest
@testable import JTransactions

final class TransactionsViewControllerTests: XCTestCase {

    func test_viewDidLoad() {
        let (sut, presenterSpy) = makeSUT()
        
        sut.viewWillAppear(false)
        XCTAssertEqual(presenterSpy.calledMethods, [.viewWillAppear])
    }
    
    func test_numberOfRows() {
        let (sut, presenterSpy) = makeSUT()
        
        presenterSpy.numberOfRowsToBeReturned = 10
        
        XCTAssertEqual(sut.tableView(UITableView(), numberOfRowsInSection: 0), 10)
    }
        
    func test_didTapOnCell() {
        let (sut, presenterSpy) = makeSUT()
        
        let index = IndexPath(row: 0, section: 0)
        sut.tableView(UITableView(), didSelectRowAt: index)
        XCTAssertEqual(presenterSpy.calledMethods, [.didTapOnCell(at: index)])
    }
}

// MARK: - Helpers

private extension TransactionsViewControllerTests {
    typealias SutAndDoubles = (
        sut: TransactionsViewController,
        presenterSpy: TransactionsPresenterInputProtocolSpy
    )

    func makeSUT() -> SutAndDoubles {
        let presenterSpy = TransactionsPresenterInputProtocolSpy()
        let sut = TransactionsViewController(presenter: presenterSpy)
        return (sut, presenterSpy)
    }
}
