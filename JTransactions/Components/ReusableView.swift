import UIKit

protocol ReusableIdentifier: AnyObject {
    static var identifier: String { get }
}

extension ReusableIdentifier {
    static var identifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableIdentifier { }

extension UITableView {
    func register<Cell: ReusableIdentifier>(_ cell: Cell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<Cell: ReusableIdentifier>(for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(Cell.identifier)")
        }
        
        return cell
    }
}
