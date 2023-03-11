import Foundation

protocol Requestable {
    var endpoint: Endpoint { get }
    var method: HTTPMethod { get }
}

extension Requestable {
    var method: HTTPMethod {
        .get
    }
}
