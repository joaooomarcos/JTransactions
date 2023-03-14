import Foundation

struct Currency: Decodable, Equatable {
    let iso3: String
    let symbol: String
    let title: String
}
