//
//  FetcherDataProtocol.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

protocol FetcherDataProtocol {
    
    func getCountries(request: [String: Any]?, completionHandler: @escaping (Result<[[String: Any]], ServerError>) -> Void)

    
}
