//
//  RocketViewController.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 22/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class RocketViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let viewModel: RocketViewModelType = RocketViewModel()
    private let activityIndicator = UIActivityIndicatorView()
    var rocketArray = [RocketModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.inputs.bindRocket()
        
        tableViewSetup()
        bindData()
    }
    
    func tableViewSetup() {
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.separatorStyle = .none
            
        tableView.register(UINib(nibName: "RocketTableViewCell", bundle: nil), forCellReuseIdentifier: "RocketTableViewCell")
    }
    
    func bindData() {
          viewModel.outputs.rocketList
              .asObservable()
              .bind(onNext: { [weak self] rocketX in
                  self?.rocketArray.append(contentsOf: rocketX)
                  DispatchQueue.main.async { [weak self] in
                      self?.tableView.reloadData()
                  }
              }).disposed(by: disposeBag)
  }

    private func setupActivityIndicator() {
        activityIndicator.color = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RocketTableViewCell", for: indexPath)
        (cell as? RocketTableViewCell)?.itemData = rocketArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 272.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idRocket = rocketArray[indexPath.row].id
        print("itemData.id::", idRocket)
        
//        let viewController = MovieDetailRouter.createModule(with: id)
//        navigationController?.pushViewController(viewController, animated: true)
    }
}

