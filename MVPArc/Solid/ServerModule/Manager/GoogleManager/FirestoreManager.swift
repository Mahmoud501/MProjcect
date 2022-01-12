//
//  FirestoreManager.swift
//  MVPArc
//
//  Created by Mahmoud Zaki on 08/01/2022.
//

import Foundation
import FirebaseFirestore

/*
 
 This class is not optimizated to use it not hanlde all event and get data from firestore repo
 
 so be under it just sample to clarify FirestoreManager and concept of solid
 
 This class do to mush things
 1- covert request to firestore request (firestore collection/docs)
 2- setup query
 3- getData from query and parse
 
 so 1 and 3 it normal for main function of this class by query based on request and return data
 must be in another class Called FirestoreQueryHandler
 */



class FirestoreManager: FBManagerProtocol {
    
    let db = Firestore.firestore()

    init() {}
    init(errorHandler: ErrorAPIHandler) {
        self.errorHandler  = errorHandler
    }
    
    var errorHandler = ErrorAPIHandler()
    
    func request(request: FIBRequest? = nil, response: FIBResponse){
        if request?.requestType == .getAll && request?.eventType == .once {
            self.getOnceAllDoc(request: request, response: response)
        }
        
    }

    
    func getOnceAllDoc(request: FIBRequest? = nil, response: FIBResponse) {
        if let path = request?.path {
            let userRef = db.collection(path);
            userRef.getDocuments { Snapshot, error in
                if let err = error {
                    response.failure?(.internalError(str: err.localizedDescription))
                }else {
                    if let docs =  Snapshot?.documents {
                        let dictResult = docs.map({ doc in
                            return doc.data()
                        })
                        let result: [String: Any] = ["countries": dictResult]
                        let data: [String: Any] = ["data": result]
                        response.success?(data)
                    }else{
                        response.failure?(.unKnown(str: "not found data in firestore"))
                    }
                }
            }
        }else {
            response.failure?(.urlError)
        }
    }
        
}
