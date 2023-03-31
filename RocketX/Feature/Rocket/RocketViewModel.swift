//
//  RocketViewModel.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 22/02/23.
//
import Foundation
import RxSwift
import RxCocoa

protocol RocketViewModelType {
    var inputs: RocketViewModelInputs { get }
    var outputs: RocketViewModelOutputs { get }
}

protocol RocketViewModelInputs {
    func bindRocket()
}

protocol RocketViewModelOutputs {
  var rocketList: Observable<[RocketModel]> { get }
}

final class RocketViewModel: RocketViewModelType {
    private let disposable = CompositeDisposable()
    let disposableBag = DisposeBag()
    var inputs: RocketViewModelInputs { self }
    var outputs: RocketViewModelOutputs { self }
    private var rocketSubject: PublishSubject<[RocketModel]> = .init()
    var isSuccessRelay: BehaviorRelay<Bool> = .init(value: false)

}

extension RocketViewModel: RocketViewModelInputs {
  func bindRocket() {
      Rocket.RocketList()
              .observe(on: MainScheduler.instance)
              .subscribe(onNext:{ [weak self] res in
                  guard let self = self else { return }
                  self.rocketSubject.onNext(res)
              }, onError: { error in
                  print(error)
              }).disposed(by: disposableBag)
    }

}

extension RocketViewModel: RocketViewModelOutputs {
  var rocketList: Observable<[RocketModel]> {
      rocketSubject.asObservable()
  }

}
