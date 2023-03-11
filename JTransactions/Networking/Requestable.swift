import Foundation

public protocol Requestable {
    var endpoint: Endpoint { get }
    var method: HTTPMethod { get }
}

public extension Requestable {
    var method: HTTPMethod {
        .get
    }
}
