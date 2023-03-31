//
//  BaseViewController.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 27/02/23.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController: UIViewController {

    private(set) lazy var className: String = {
        type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad: \(self.className)")
        // Do any additional setup after loading the view.
    }

}
