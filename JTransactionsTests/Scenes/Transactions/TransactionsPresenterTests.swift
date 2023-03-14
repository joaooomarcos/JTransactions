import XCTest
@testable import JTransactions

final class TransactionsPresenterTests: XCTestCase {
    
    // MARK: - Input
    
    func test_viewWillAppear() {
        let (sut, doubles) = makeSUT()
        
        sut.viewWillAppear()
        
        XCTAssertEqual(doubles.interactorSpy.calledMethods, [.fetchData])
        XCTAssertEqual(doubles.viewContollerSpy.calledMethods, [.showLoading])
    }
    
    func test_didTapOnCell() {
        let (sut, doubles) = makeSUT()
        
        let mock = Transaction.mock
        sut.fetchSucceded(models: [mock])
        sut.didTapOnCell(at: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(doubles.routerSpy.calledMethods, [.showDetail(transaction: .init(with: mock))])
    }
    
    // MARK: - Output
    
    func test_fetchSucceded_empty() {
        let (sut, doubles) = makeSUT()
        
        sut.fetchSucceded(models: [])
        
        XCTAssertEqual(doubles.viewContollerSpy.calledMethods, [.removeStates, .showEmptyState])
    }
    
    func test_fetchSucceded() {
        let (sut, doubles) = makeSUT()
        
        sut.fetchSucceded(models: [.mock])
        
        XCTAssertEqual(doubles.viewContollerSpy.calledMethods, [.removeStates, .showData])
    }
    
    func test_fetchFailed() {
        let (sut, doubles) = makeSUT()
        
        sut.fetchFailed(error: .custom("teste"))
        
        XCTAssertEqual(doubles.viewContollerSpy.calledMethods, [.removeStates, .showEmptyState, .showError(title: "Erreur", message: "Nous avons eu un problème")])
    }
}

// MARK: - Helpers

private extension TransactionsPresenterTests {
    typealias SutAndDoubles = (
        sut: TransactionsPresenter,
        doubles: (interactorSpy: TransactionsInteractorInputProtocolSpy,
                  routerSpy: TransactionsRouterProtocolSpy,
                  viewContollerSpy: TransactionsPresenterOutputProtocolSpy)
    )

    func makeSUT() -> SutAndDoubles {
        let interactorSpy = TransactionsInteractorInputProtocolSpy()
        let routerSpy = TransactionsRouterProtocolSpy()
        let viewContollerSpy = TransactionsPresenterOutputProtocolSpy()
        let sut = TransactionsPresenter(router: routerSpy,
                                                     interactor: interactorSpy)
        sut.viewController = viewContollerSpy
        return (sut, (interactorSpy, routerSpy, viewContollerSpy))
    }
}
