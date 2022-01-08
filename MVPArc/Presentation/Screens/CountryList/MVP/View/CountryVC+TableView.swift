//
//  CountryVC+TableView.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 01/01/2022.
//

import Foundation
import UIKit

extension CountryViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //config cell
        cell.textLabel?.textAlignment = .right
        cell.textLabel?.text = presenter?.list[indexPath.row]["name"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //delete country
    }
    
}
