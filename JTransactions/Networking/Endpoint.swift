import Foundation

struct Endpoint {
    var base: String
    var path: String
    
    init(base: String = String(),
         path: String = String()) {
        self.base = base
        self.path = path
    }
}
