//
//  ErrorAPI.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 21/02/23.
//

import Foundation
enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case badRequest             //Status code 400
}
