//
//  FIBResponse.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

class FIBResponse {
    var success: (([String: Any]?)->())?
    var failure: ((ServerError)->())?
}
