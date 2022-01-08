//
//  ServerErrorTypes.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

enum ServerError: Error {
    
    case urlError
    case networkError
    case serverError
    case unAuthentication
    case unAuthorization
    case internalError(str: String?)
    case validationError(arr: [[String: Any]]?)
    case unKnown(str: String?)
    
    var errorDescription: String? {
        switch self {
        case .urlError:
            return "url not correct"
        case .networkError:
            return "No internet connection"
        case .unAuthentication, .unAuthorization:
            return "unauth person"
        default:
            return ""
        }
    }
    
}
