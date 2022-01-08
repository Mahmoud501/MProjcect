//
//  ViewController.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 01/01/2022.
//

import UIKit
import Alamofire

//Clean Code
// read,
//Solid
//Clean Arch (MVC, MVP ,MVVM ,VIP ,VIPER)

//Hold Data
//Setup UI
//Hanlde UI
//Usage Libraries
//get Data
//Processing

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var list: [[String: Any]] = [[String: Any]]()
    @IBOutlet weak var TVTable: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.activity.startAnimating()
        getCountries()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //config cell
        cell.textLabel?.textAlignment = .right
        cell.textLabel?.text = list[indexPath.row]["name"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delete country
    }
    
    //Get Countries From API
    
    func getCountries() {
        AF.request("https://testapp.sofood.co.il/api/clients/countries").response { response in
            self.activity.stopAnimating()
            if response.response?.statusCode == 200 {
                //convert data to json
                do {
                    // make sure this JSON is in the format we expect
                    //pass json to my model

                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                        // try to read out a string array
                        let data = json["data"] as? [String: Any]
                        let countries = data?["countries"] as? [[String: Any]]
                        self.list = countries ?? []
                        
                        //update ui
                        self.TVTable.reloadData()
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
                
            }else {
                //internet error
            }
        }
    }
    
    
    
    func deleteCountries(id: Int) {
        AF.request("https://testdddapp.sofood.co.il/api/clients/countries", method: .delete,parameters: ["id": id]).response { response in
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
                    let myalert = UIAlertController(title: "Error", message: "serror error", preferredStyle: UIAlertController.Style.alert)
                    myalert.addAction(UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
                        print("Selected")
                    })
                    self.present(myalert, animated: true)

                }

            }else {
                //internet error
                //show popup
                let myalert = UIAlertController(title: "Error", message: "internet error", preferredStyle: UIAlertController.Style.alert)
                myalert.addAction(UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
                    print("Selected")
                })
                self.present(myalert, animated: true)

            }
            
        }
    }
    
    

}

