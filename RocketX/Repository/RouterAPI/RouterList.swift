//
//  RouterList.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 21/02/23.
//

import Foundation
import RxSwift
import RxCocoa

class Rocket: ApiClient {

  static func RocketList() -> Observable<[RocketModel]> {
   
      return request(Constants.BASE_URL + "/rockets", method: .get, parameters: [:])
  }
}
