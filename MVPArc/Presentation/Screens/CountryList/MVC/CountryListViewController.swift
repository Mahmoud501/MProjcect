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

//Setup UI
//Hanlde UI

class CountryListViewController: UIViewController {
   

    var controller: CountryController? = CountryController()
    
    @IBOutlet weak var TVTable: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.activity.startAnimating()
        controller?.getCountries(success: {
            self.activity.stopAnimating()
            self.TVTable.reloadData()
        }, error: { Error in
            self.activity.stopAnimating()
            self.showPopup(msg: Error)
        })
    }

    
  
    
    func showPopup(msg: String) {
        let myalert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertController.Style.alert)
        myalert.addAction(UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
            print("Selected")
        })
        self.present(myalert, animated: true)

    }

}

