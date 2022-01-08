//
//  ParseDataHandler.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 07/01/2022.
//

import Foundation

protocol ParseProtocol {
    
    func parse(data: Data?) -> [String: Any]?
 
}

