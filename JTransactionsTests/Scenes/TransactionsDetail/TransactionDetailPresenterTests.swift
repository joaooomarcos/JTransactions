import XCTest
@testable import JTransactions

final class TransactionDetailPresenterTests: XCTestCase {
    
    // MARK: - Input
    
    func test_viewDidLoad() {
        let (sut, doubles) = makeSUT()
        
        sut.viewDidLoad()
        
        XCTAssertEqual(doubles.viewContollerSpy.calledMethods,
                       [.fill(model: doubles.modelMock)])
    }
    
    func test_numberOfRows() {
        let (sut, doubles) = makeSUT()
        
        XCTAssertEqual(sut.numberOfRows,
                       4)
    }
    
    func test_actionsForCell() {
        let (sut, doubles) = makeSUT()
        
        let category = DetailAction.category(bgColor: doubles.modelMock.backgroundColor,
                                             borderColor: doubles.modelMock.borderColor,
                                             icon: doubles.modelMock.smallIcon,
                                             iconURL: doubles.modelMock.smallIconURL)
        
        XCTAssertEqual(sut.actionForCell(at: IndexPath(row: 0, section: 0)),
                       category)
        XCTAssertEqual(sut.actionForCell(at: IndexPath(row: 1, section: 0)),
                       .split)
        XCTAssertEqual(sut.actionForCell(at: IndexPath(row: 2, section: 0)),
                       .like)
        XCTAssertEqual(sut.actionForCell(at: IndexPath(row: 3, section: 0)),
                       .problem)
    }
    
    func test_didTapOnClose() {
        let (sut, doubles) = makeSUT()
        
        sut.didTapOnClose()
        
        XCTAssertEqual(doubles.routerSpy.calledMethods,
                       [.dismiss])
    }
}

// MARK: - Helpers

private extension TransactionDetailPresenterTests {
    typealias SutAndDoubles = (
        sut: TransactionDetailPresenter,
        doubles: (interactorSpy: TransactionDetailInteractorInputProtocolSpy,
                  routerSpy: TransactionDetailRouterProtocolSpy,
                  viewContollerSpy: TransactionDetailPresenterOutputProtocolSpy,
                  modelMock: TransactionPresentationModel)
    )

    func makeSUT() -> SutAndDoubles {
        let interactorSpy = TransactionDetailInteractorInputProtocolSpy()
        let routerSpy = TransactionDetailRouterProtocolSpy()
        let viewContollerSpy = TransactionDetailPresenterOutputProtocolSpy()
        let modelMock = TransactionPresentationModel(with: .mock)
        let sut = TransactionDetailPresenter(router: routerSpy,
                                             interactor: interactorSpy,
                                             model: modelMock)
        sut.viewController = viewContollerSpy
        return (sut, (interactorSpy, routerSpy, viewContollerSpy, modelMock))
    }
}
