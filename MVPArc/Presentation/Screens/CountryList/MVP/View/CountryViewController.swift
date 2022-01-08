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

class CountryViewController: UIViewController {
   

    var presenter: CountryPresenter? = CountryPresenter()
    
    @IBOutlet weak var TVTable: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.delegate = self
        presenter?.getCountries()
    }

    
  
    
    func showPopup(msg: String) {
        let myalert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertController.Style.alert)
        myalert.addAction(UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in
            print("Selected")
        })
        self.present(myalert, animated: true)

    }

}

