//
//  AlamofireManager.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation
import Alamofire

class AlamofireManager: StorageManangerProtocol {
    init() {}
    init(errorHandler: ErrorAPIHandler) {
        self.errorHandler  = errorHandler
    }
    
    var errorHandler = ErrorAPIHandler()
    
    func request(request: ServerRequest? = nil, response: ServerResponse){
        AF.request(request?.apiUrl ?? "",method: AlamofireManager.getMethod(method: request?.method ?? .get),parameters: request?.paramters, headers: HTTPHeaders.init(request?.headers ?? [:])).response { result in
            if let errorResult = self.errorHandler.verifyError(statusCode: result.response?.statusCode ?? 500, data: result.data!) {
                response.failure?(errorResult)
            }else {
                response.success?(result.data!)
            }
        }
    }
    
}

extension AlamofireManager {
    static func getMethod(method: HttpMethod?) -> HTTPMethod {
        switch method {
        case .get:
            return .get
        case .post:
            return .post
        case .delete:
            return .delete
        case .put:
            return .put
        case .none:
            return HTTPMethod.get
        }
    }
}
