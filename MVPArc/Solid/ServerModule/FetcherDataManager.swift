//
//  FetcherManager.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 07/01/2022.
//

import Foundation


class FetcherDataManager {
    
    //Get Countries From API
    let storage = MoyaManager()
    var parserHandler: ParseDataHanlder? = ParseDataHanlder()

    func getCountries(request: [String: Any]? = nil, completionHandler: @escaping (Result<[[String: Any]], ServerError>) -> Void) {
        let arequest = ServerRequest()
        arequest.apiName = .getCountries
        arequest.baseURL = "https://testapp.sofood.co.il"
        arequest.apiPath = "/api/clients/countries"
        arequest.apiUrl = "https://testapp.sofood.co.il/api/clients/countries"
        arequest.method = .get
        arequest.paramters = request
        let response = ServerResponse()
        response.success = { [weak self] receivedData in
            guard let self = self else { return }
            let json = self.parserHandler?.parse(data: receivedData!)
            let data = json?["data"] as? [String: Any]
            let countries = data?["countries"] as? [[String: Any]]
            completionHandler(.success(countries ?? []))
        }
        response.failure = { err in
            completionHandler(.failure(err))
        }
        storage.request(request: arequest, response: response)
    }
    
    func getCountries2(request: [String: Any]? = nil, completionHandler: @escaping (Result<[[String: Any]], ServerError>) -> Void) {
        let arequest = ServerRequest()
        arequest.apiName = .getCountries
        arequest.baseURL = "https://testapp.sofood.co.il"
        arequest.apiPath = "/api/clients/countries"
        arequest.apiUrl = "https://testapp.sofood.co.il/api/clients/coufafaffafantries"
        arequest.method = .get
        arequest.paramters = request
        let response = ServerResponse()
        response.success = { [weak self] receivedData in
            guard let self = self else { return }
            let json = self.parserHandler?.parse(type: .json, data: receivedData)
            let data = json?["data"] as? [String: Any]
            let countries = data?["countries"] as? [[String: Any]]
            completionHandler(.success(countries ?? []))
        }
        response.failure = { err in
            completionHandler(.failure(err))
        }
        storage.request(request: arequest, response: response)
    }
    

    
    
//
//    func deleteCountries(id: Int, success: ((Data?)->())?, error: ((Error?)->())?) {
//        AF.request("https://testdddapp.sofood.co.il/api/clients/countries", method: .delete,parameters: ["id": id]).response { response in
//            if response.response?.statusCode == 200 {
//                success?(response.data);
//            }else {
//                error?(response.error)
//            }
//
//        }
//    }
    
    
    
    //    func getCountriesImprove(completionHandler: @escaping (Result<Data?, NSError>)-> Void) {
    //        AF.request("https://testapp.sofood.co.il/api/clients/countries").response { response in
    //            if response.response?.statusCode == 200 {
    //                completionHandler(.success(response.data))
    //            }else {
    //                let currentError = NSError.init(domain: response.error?.localizedDescription ?? "unKnown", code: response.response?.statusCode ?? 500, userInfo: nil)
    //                completionHandler(.failure(currentError))
    //                //internet error
    //            }
    //        }
    //    }

}
