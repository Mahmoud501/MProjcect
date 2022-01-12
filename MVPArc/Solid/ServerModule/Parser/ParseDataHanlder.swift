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
    init(type: ParseType? = nil) {
        switch type {
        case .json:
            self.parser = ParseJsonHandler()
        case .xml:
            self.parser = ParseXMLHandler()
        case .none:
            print("not support these")
        }
    }
    
    func parse(type: ParseType? = nil, data: Data?) -> [String: Any]? {
        if parser != nil {
            return parser?.parse(data: data)
        }else {
            switch type {
            case .json:
                return ParseJsonHandler().parse(data: data)
            case .xml:
                return ParseXMLHandler().parse(data: data)
            case .none:
                return nil
            }
        }
       
    }
    
    
}
