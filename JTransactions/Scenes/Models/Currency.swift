import Foundation

struct Currency: Decodable {
    let iso3: String
    let symbol: String
    let title: String
}
