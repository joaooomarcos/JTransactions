import Foundation

struct Amount: Decodable, Equatable {
    let value: Double
    let currency: Currency
}
