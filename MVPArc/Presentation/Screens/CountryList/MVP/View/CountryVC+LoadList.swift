//
//  CountryVC+LoadList.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 01/01/2022.
//

import Foundation

extension CountryViewController: CountryListView {
    func loadingView() {
        self.activity.startAnimating()
    }
    
    func stopLoading() {
        self.activity.stopAnimating()
    }
    
    func successLoad() {
        self.TVTable.reloadData()
    }
    
    func errorLoad(error: String) {
        showPopup(msg: error)
    }
}
