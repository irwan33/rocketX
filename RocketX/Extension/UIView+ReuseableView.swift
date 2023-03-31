//
//  UIView+ReuseableView.swift
//  RocketX
//
//  Created by Ewide Dev. 2 on 01/03/23.
//

import UIKit

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    // reusableIdentifier == ClassName
    public static var reuseIdentifier: String { String(describing: self) }
}
