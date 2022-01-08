

//
//  CountryPresenter.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 01/01/2022.
//

//phone number -> id or interface or protocol

//when press -> do some action


//1- define ids - intefaces - protocls
//2- setup ids
//3- actions for every protocols


import Foundation
import Alamofire

//get countries

class CountryPresenter: CountryListBusinessProtocol, CountryListDatasourceProtocol {
    
    
    var list: [[String: Any]] = [[String: Any]]()

    var delegate: CountryListView?

    // API GET Countries FROM SERVER
    func getCountries() {
        self.delegate?.loadingView()
        AF.request("https://testapp.sofood.co.il/api/clients/countries").response { response in
            self.delegate?.stopLoading()
            if response.response?.statusCode == 200 {
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                        // try to read out a string array
                        let jsondata = json["data"] as? [String: Any]
                        self.list = jsondata?["countries"] as? [[String: Any]] ?? []
                        self.delegate?.successLoad()
                    }
                } catch let err as NSError {
                    print("Failed to load: \(err.localizedDescription)")
                    self.delegate?.errorLoad(error: err.localizedDescription)
                }

            }else if response.response?.statusCode == 404 {
                self.delegate?.errorLoad(error: "ss error")
            }else {
                //internet error
                self.delegate?.errorLoad(error: "net error")


            }
            
        }
    }


    

}
