//
//  ParseDataHanlder.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation
enum ParseType {
    case json
    case xml
}

class ParseDataHanlder {
    
    var parser: ParseProtocol?
    init(){
        parser = ParseJsonHandler()
    }
    
    init(parser: ParseProtocol?) {
        self.parser = parser
    }
    
    func parse(type: ParseType? = nil, data: Data?) -> [String: Any]? {
        if parser != nil {
            return parser?.parse(data: data)
        }else {
            switch type {
            case .json:
                let newParser = ParseJsonHandler()
                return newParser.parse(data: data)
            case .xml:
                let newParser = ParseXMLHandler()
                return newParser.parse(data: data)
            case .none:
                return nil
            }
        }
       
    }
    
    
}
