//
//  RemoteConstant.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 21/02/23.
//

import Foundation
import Alamofire

enum Constants {
    
    //The API's base URL
    static let BASE_URL = "https://api.spacexdata.com/v4"
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case apikey = "apikey"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
