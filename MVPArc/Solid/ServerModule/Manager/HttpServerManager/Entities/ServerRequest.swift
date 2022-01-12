//
//  ServerEntities.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

class ServerRequest {
    var baseURL: String?
    var apiPath: String?
    var apiUrl: String?
    var apiName: String?
    var method: HttpMethod?
    var paramters: [String: Any]?
    var headers: [String: String]?
}

