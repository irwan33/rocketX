//
//  UITableview+Extension.swift
//  RocketX
//
//  Created by Ewide Dev. 2 on 01/03/23.
//

import UIKit

extension UITableViewHeaderFooterView: ReusableView {}
extension UITableViewCell: ReusableView {}

extension UITableView {
    //  Register nib
    func register<T: UITableViewCell>(_ className: T.Type) {
        let cellName = String(describing: T.self)
        let nib = UINib(nibName: cellName, bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cellName))
    }
    
    func register<T: UITableViewHeaderFooterView>(_ className: T.Type) {
        let cellName = String(describing: T.self)
        let nib = UINib(nibName: cellName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: cellName))
    }
    
    //
    func register<T: UITableViewCell>(with className: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooterViewWith className: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
}
