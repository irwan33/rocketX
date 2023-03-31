//
//  Extention+ViewController.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 01/03/23.
//

import UIKit

extension UIViewController {
    
    @objc func lap_viewDidLoad() {
        self.lap_viewDidLoad()

        self.setupViews()
        self.bindViewModel()
    }
    
    @objc func lap_viewWillAppear(_ animated: Bool) {
        self.lap_viewWillAppear(animated)
        
            self.bindStyles()
        
    }

    /**
    The entry point to initialize styles ( font, color ), data ( text, image, model etc... ) to UI elements ( JUST ONE ). Called just before `viewDidLoad`.

    Ex) titleLabel.color = .green
     titleLabel.text = "TEST"
     titleImageView.image = UIImage(named: "")
    */
    @objc open func setupViews() { }
    
    /**
     The entry point to bind all view model outputs. Called just before `viewDidLoad`.
     */
    @objc open func bindViewModel() { }
    
    /**
     The entry point to bind all styles to UI elements. Called just after `viewWillAppear`.
     */
    @objc open func bindStyles() { }
    
    private struct AssociatedKeys {
        static var hasViewAppeared: String = "hasViewAppeared"
    }
}


import Foundation

protocol HasSetup { }

extension HasSetup {
    func setup(closure: (Self) -> Void) {
        closure(self)
    }
}

extension NSObject: HasSetup { }
