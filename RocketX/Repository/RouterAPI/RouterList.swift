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
   
      return request(Constants.BASE_URL, method: .get, parameters: [:])
  }
    
    static func RocketDetail(isId: String) -> Observable<RocketModel> {
     
      return request(Constants.BASE_URL + "/5e9d0d95eda69955f709d1eb", method: .get, parameters: [:])
  }
}
