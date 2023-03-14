import Foundation
@testable import JTransactions

final class EnvironmentMock: EnvironmentProtocol {
    var baseURL: String {
        "https://www.google.com"
    }
}
