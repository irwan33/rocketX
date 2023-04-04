//
//  RocketDetailViewController.swift
//  RocketX
//
//  Created by Ewide Dev. 2 on 03/04/23.
//

import UIKit
import RxSwift
import RxCocoa

class RocketDetailViewController: BaseViewController {

    @IBOutlet weak var recketDetailImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleDetailRocket: UILabel!
    var rocketId: String?
    private let viewModel: RocketDetailViewModelType = RocketDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel.inputs.bindRocketDetail(id: rocketId!)
        bindData()
    }
    
    func bindData() {
        viewModel.outputs.rocketDetail
              .asObservable()
              .bind(onNext: { [weak self] rocketX in
                  self?.descriptionLabel.text = rocketX.welcomeDescription
                  self?.titleDetailRocket.text = rocketX.name
                  guard let imgRocket = rocketX.flickrImages.first else { return }
                  self?.recketDetailImage.kf.setImage(with: URL(string: imgRocket))
              }).disposed(by: disposeBag)
  }
}
