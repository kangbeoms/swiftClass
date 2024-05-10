//
//  InsertModel.swift
//  FirebaseImageAddress
//
//  Created by 김수진 on 5/10/24.
//

import Foundation
import Firebase // <<<<

struct InsertModel{
    let db = Firestore.firestore()
    
    func insertItems(name: String, phone: String, address: String, relation: String, image: String) -> Bool {
        var status: Bool = true
        
        db.collection("addressLists").addDocument(data: [
            "name" : name,
            "phone" : phone,
            "address" : address,
            "relation" : relation,
            "image" : image
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
