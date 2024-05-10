//
//  InsertModel.swift
//  FirebaseList
//
//  Created by TJ on 2024/05/09.
//

import Foundation
import Firebase

struct InsertModel{
    let db = Firestore.firestore()
    
    func insertItems(code: String, name: String, dept: String, phone: String) -> Bool{
        var status: Bool = true
        
        db.collection("students").addDocument(data: [
            "code" : code,
            "name" : name,
            "dept" : dept,
            "phone" : phone
        ]){error in
            if error != nil{
                status = false
            }else{
                status = true
            }
            
        }
        return status
    }
}
