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

class SolidVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var controller: SolidController? = SolidController()
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var TVTable: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    @IBAction func firClicked(_ sender: Any) {
        lblTitle.text = "firestore"
        self.activity.startAnimating()
        controller?.getFromCountriesFIB(success: {
            self.activity.stopAnimating()
            self.TVTable.reloadData()
        }, error: { error in
            self.activity.stopAnimating()
            self.TVTable.backgroundColor = .red
        })

    }
    
    @IBAction func serverClicked(_ sender: Any) {
        lblTitle.text = "alamofire"
        self.activity.startAnimating()
        getCountries(isMoya: false)
    }
    
    @IBAction func serverMoya(_ sender: Any) {
        lblTitle.text = "moya"
        self.activity.startAnimating()
        getCountries(isMoya: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  controller?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //config cell
        cell.textLabel?.textAlignment = .right
        cell.textLabel?.text = controller?.list[indexPath.row]["name"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delete country
    }
    
    func getCountries(isMoya: Bool) {
        controller?.getCoutriesFromServer(isMoya: isMoya, success: {
            self.activity.stopAnimating()
            self.TVTable.reloadData()
        }, error: { error in
            self.activity.stopAnimating()
            self.TVTable.backgroundColor = .red
        })
    }
    

}

