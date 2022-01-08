//
//  MoyaManager.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation
import Moya

struct ApiRequestMoya: TargetType {
    var request: ServerRequest?
    init(request: ServerRequest?) {
        self.request = request
    }
    
    var baseURL: URL {
        return URL.init(string: request?.baseURL ?? "")!
    }
    
    var path: String {
        return request?.apiPath ?? ""
    }
    
    var method: Moya.Method {
        return MoyaManager.getMethod(method: request?.method ?? .get)
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        let dic = request?.paramters?.map({ (key, value) in
            return [key :(value as AnyObject).description ?? ""]
        })        
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(dic) {
            return jsonData
        }
        return Data()
    }
    
    var headers: [String : String]? {
        return nil
    }
}


class MoyaManager {
    
    let errorHandler = ErrorAPIHandler()
    let provider = MoyaProvider<ApiRequestMoya>.init()

    static func getMethod(method: HttpMethod?) -> Moya.Method {
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
            return Moya.Method.get
        }
    }
    
    func request(request: ServerRequest? = nil, response: ServerResponse){
        provider.request(ApiRequestMoya.init(request: request)) { result in
            switch result {
            case .success(let res):
                if let errorResult = self.errorHandler.verifyError(statusCode: res.statusCode , data: res.data) {
                    response.failure?(errorResult)
                }
                response.success?(res.data)
                break
            case .failure(let error):
                let errorResult = self.errorHandler.verifyError(statusCode: error.response?.statusCode ?? 500, data: error.response?.data)
                response.failure?(errorResult ?? .unKnown(str: "unknown from moya Moya mangager"))
                break
            }
        }
        
    }
    
}
