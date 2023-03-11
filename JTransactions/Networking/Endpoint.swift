import Foundation

public struct Endpoint {
    var base: String
    var path: String
    
    public init(base: String = String(),
                path: String = String()) {
        self.base = base
        self.path = path
    }
}
