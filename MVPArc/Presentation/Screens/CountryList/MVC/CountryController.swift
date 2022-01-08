//
//  CountryController.swift
//  MVPArchitecture
//
//  Created by Mahmoud Zaki on 01/01/2022.
//

import Foundation
import Alamofire

//get countries

class CountryController {
    
    var list: [[String: Any]] = [[String: Any]]()

    // API GET Countries FROM SERVER
    func getCountries(success: (()->())?, error: ((String)->())?) {
        
        AF.request("https://testapp.sofood.co.il/api/clients/countries").response { response in
            if response.response?.statusCode == 200 {
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                        // try to read out a string array
                        let jsondata = json["data"] as? [String: Any]
                        self.list = jsondata?["countries"] as? [[String: Any]] ?? []
                        success?()
                    }
                } catch let err as NSError {
                    print("Failed to load: \(err.localizedDescription)")
                    error?(err.localizedDescription)
                }

            }else if response.response?.statusCode == 404 {
                error?("server error")
            }else {
                //internet error
                error?("internet error")

            }
            
        }
    }

    
    func deleteCountries(id: Int) {
        AF.request("https://testapp.sofood.co.il/api/clients/countries", method: .delete,parameters: ["id": id]).response { response in
            if response.response?.statusCode == 200 {
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                        let code = json["code"] as? Int
                        if code == 200 {
                            // try to read out a string array
                            let country = json["data"] as? [String: Any]
                            let newCountries = self.list.filter { item in
                                if (item["id"] as? Int) == id {
                                    return false
                                }
                                return true
                            }
                            self.list = newCountries
                        }else if code == 400 {
                            // show popup error in countries params
                        }else {
                            // show popup errror in server
                        }
                        
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")

                }

            }else {
                //internet error
                //show popup

            }
            
        }
    }

}
