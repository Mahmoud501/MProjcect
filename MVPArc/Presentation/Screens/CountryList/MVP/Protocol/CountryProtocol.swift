//
//  CountryProtocol.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 01/01/2022.
//

import Foundation

protocol CountryListView {
    func loadingView()
    func stopLoading()
    func successLoad()
    func errorLoad(error: String)

}

protocol CountryListDatasourceProtocol {
    
    var list: [[String: Any]] { get set }
    
}


protocol CountryListBusinessProtocol {
    
    func getCountries()

    
}
