//
//  ServerResponse.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation

class ServerResponse {
    var success: ((Data?)->())?
    var failure: ((ServerError)->())?
}
