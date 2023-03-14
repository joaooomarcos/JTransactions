import Foundation
@testable import JTransactions

final class RequestableFake: Requestable {
    var endpoint: Endpoint
        
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
}
