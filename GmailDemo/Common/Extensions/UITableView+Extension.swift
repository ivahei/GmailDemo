//
//  UITableView+Extension.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type,
                                                 forIndexPath indexPath: IndexPath) -> T {

        guard let cell = dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T
        else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.className)") }

        return cell
    }

    func register<T: UITableViewCell>(_ type: T.Type) {
        register(UINib(nibName: String(describing: type), bundle: nil), forCellReuseIdentifier: T.className)
    }
}
