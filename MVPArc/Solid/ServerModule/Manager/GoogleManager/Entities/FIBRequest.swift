//
//  FIBRequest.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

enum EventTypeObserver {
    case listen
    case once
}

enum RequestType {
    case getById
    case getAll
    case updateById
    case updateByQuery
    case deleteById
    case deleteAll
    case insert
    case insertList
}

class FIBRequest {
    var path: String = ""
    var requestType: RequestType = .getAll
    var eventType: EventTypeObserver = .once
    var paramters: [String: Any]?
}
