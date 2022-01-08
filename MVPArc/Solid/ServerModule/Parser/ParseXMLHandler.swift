//
//  ParseXMLHandler.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation


class ParseXMLHandler: ParseProtocol {
    func parse(data: Data?) -> [String: Any]? {
        if let data = data {
            return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        }
        return nil
    }
}

