//
//  FirestoreManager.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation
import FirebaseFirestore

class FIBFetcherDataManager: FetcherDataProtocol {
    
    var storage: FBManagerProtocol = FirestoreManager()
    init() {}
    init(storage: FBManagerProtocol? = nil, parserType: ParseType? = nil) {
        if (storage != nil) {
            self.storage = storage!
        }
    }

    func getCountries(request: [String : Any]? = nil, completionHandler: @escaping (Result<[[String : Any]], ServerError>) -> Void) {
        let request = FIBRequest()
        request.path = "countries/"
        request.eventType = .once
        request.requestType = .getAll
        let response = FIBResponse()
        response.success = { jsonObj in
            let data = jsonObj?["data"] as? [String: Any]
            let countries = data?["countries"] as? [[String: Any]]
            completionHandler(.success(countries ?? []))
        }
        response.failure = { err in
            completionHandler(.failure(err))
        }
        storage.request(request: request, response: response)
        
    }
    
}
