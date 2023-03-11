import Foundation

protocol EnvironmentProtocol {
    var baseURL: String { get }
}

struct Environment: EnvironmentProtocol {
    var baseURL: String {
        "https://gist.githubusercontent.com"
    }
}
