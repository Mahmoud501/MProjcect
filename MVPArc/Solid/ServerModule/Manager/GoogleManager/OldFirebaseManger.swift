//
//  OldFirebaseManger.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 09/01/2022.
//

import Foundation

// just clarify anather manager
//its like Moya and alamofire
//here alamofireManger is OldFireManager and MoyaManger is FirestoreManager
//but all in another repo that not depend on http request that call 
class OldFireManager: FBManagerProtocol {
    
    func request(request: FIBRequest?, response: FIBResponse) {
        // same thing in firestore will happen here
    }

}
