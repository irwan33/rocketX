//
//  RocketDetailViewModel.swift
//  RocketX
//
//  Created by Ewide Dev. 2 on 03/04/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol RocketDetailViewModelType {
    var inputs: RocketDetailViewModelInputs { get }
    var outputs: RocketDetailViewModelOutputs { get }
}

protocol RocketDetailViewModelInputs {
    func bindRocketDetail(id: String)
}

protocol RocketDetailViewModelOutputs {
  var rocketDetail: Observable<RocketModel> { get }
}

final class RocketDetailViewModel: RocketDetailViewModelType {
    private let disposable = CompositeDisposable()
    let disposableBag = DisposeBag()
    var inputs: RocketDetailViewModelInputs { self }
    var outputs: RocketDetailViewModelOutputs { self }
    private var rocketDetailSubject: PublishSubject<RocketModel> = .init()
    var isSuccessRelay: BehaviorRelay<Bool> = .init(value: false)

}

extension RocketDetailViewModel: RocketDetailViewModelInputs {
    func bindRocketDetail(id: String) {
        Rocket.RocketDetail(isId: id)
                .observe(on: MainScheduler.instance)
                .subscribe(onNext:{ [weak self] res in
                    guard let self = self else { return }
                    self.rocketDetailSubject.onNext(res)
                }, onError: { error in
                    print(error)
                }).disposed(by: disposableBag)
    }
}

extension RocketDetailViewModel: RocketDetailViewModelOutputs {
    var rocketDetail: RxSwift.Observable<RocketModel> {
        rocketDetailSubject.asObservable()
    }
}
