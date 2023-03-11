import Foundation

public enum RequestError: Error, Equatable {
    case emptyData
    case parseError
    case urlError
    case custom(String)
}
