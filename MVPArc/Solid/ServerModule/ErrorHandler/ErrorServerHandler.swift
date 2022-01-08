//
//  ErrorAPIHandler.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

class ErrorAPIHandler {
    var parser: ParseProtocol?
    
    init() {
        parser = ParseJsonHandler()
    }
    
    init(parser: ParseProtocol?) {
        self.parser = parser
    }
    
    func verifyError(statusCode: Int,data: Data?) -> ServerError? {
        if statusCode == 200 {
           return verifyInteralError(data: data)
        }
        if statusCode == 404 {
            return .urlError
        }else if statusCode == 401 {
            return .unAuthentication
        }else if statusCode == 403 {
            return .unAuthorization
        }else if statusCode == 500 {
            return .serverError
        }
        return .networkError
    }
    
    
    func verifyInteralError(data: Data?)-> ServerError?  {
        if let data = data {
            let json = parser?.parse(data: data)
            if let serverCode = json?["code"] as? Int {
                if serverCode == 200 {
                    return nil
                }
                if serverCode == 410 {
                    return .validationError(arr: json?["error_messages"] as? [[String: Any]])
                }else if serverCode != 200  {
                    return verifyError(statusCode: serverCode, data: nil)
                }else {
                    return .unKnown(str: "error not exist in my dataset\n status code\(200) servercode\(serverCode)")
                }
            }else {
                return .unKnown(str: "status code 200 and interal code not exist")
            }
        }else {
            return .unKnown(str: "200 with no data")
        }
    }
    
}
