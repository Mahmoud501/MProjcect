//
//  SolidController.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

class SolidController {
    
    var list = [[String: Any]]()
    
    
    
    private func getCountries (fetcher: FetcherDataProtocol?,success: (()->())?, error: ((String)->())?) {

        fetcher?.getCountries(request: nil) { result in
            switch result {
            case .success(let data):
                self.list = data
                success?()
                break
                
            case .failure(let err):
                error?(err.errorDescription ?? "")
                break
            }
        }
    }
        
    
    func getCoutriesFromServer(isMoya: Bool = false,success: (()->())?, error: ((String)->())?) {
        getCountries(fetcher: ServerFetcherDataManager(storage: isMoya ? MoyaManager() : AlamofireManager()), success: success, error: error)
    }
    
    func getFromCountriesFIB(success: (()->())?, error: ((String)->())?) {
        getCountries(fetcher: FIBFetcherDataManager(), success: success, error: error)
    }
    
}
