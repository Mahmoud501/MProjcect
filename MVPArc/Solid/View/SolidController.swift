//
//  SolidController.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

class SolidController {
    
    var list = [[String: Any]]()
    
    var Fetcher = FetcherDataManager()
    
    func getCountries (success: (()->())?, error: ((String)->())?) {

        Fetcher.getCountries() { result in
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
    
}
