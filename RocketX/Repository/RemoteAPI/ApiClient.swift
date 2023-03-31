//
//  ApiClient.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 21/02/23.
//

import Foundation
import Alamofire
import RxSwift

class ApiClient {
    //-------------------------------------------------------------------------------------------------------------------------
    //MARK: - The request function to get results in an Observable
  public static func request<T: Codable>(_ urlConvertible: String, method: HTTPMethod, parameters: [String: Any]? = nil) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible, method: method, parameters: parameters, headers: nil)
              .responseDecodable { (response: AFDataResponse<T>) in
                print("""
                    \n\t[🚀 REQUEST 🚀]
                    URL\t\t\t\t: \(urlConvertible)
                    BODY\t\t\t: \(String(describing: parameters))
                    """)

                switch response.result {
                case .success(let value):
                    
                  print("""
                  \n\t[🎁 RESPONSE 🎁]
                      RESULT\t\t\t: \(value.prettyPrintedJSONString!)
                  """)
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    switch response.response?.statusCode {
                    case 403:
                        observer.onError(ApiError.forbidden)
                    case 404:
                        observer.onError(ApiError.notFound)
                    case 409:
                        observer.onError(ApiError.conflict)
                    case 500:
                        observer.onError(ApiError.internalServerError)
                    case 400:
                      observer.onError(ApiError.badRequest)
//                      if let data = response.data,
//                          let _ = String(data: data, encoding: .utf8) {
//                          do{
//                              let json = try JSON(data: data)
//                                  print(json)
//                              let message = json["message"].string
//                              UIApplication.shared.keyWindow?.rootViewController?.makeToast(text: message, type: .error)
//                          } catch {
//                              print("Unexpected error: \(error).")
//                          }
//                      }
                    default:
                        observer.onError(error)
                    }
                }
              }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
 
