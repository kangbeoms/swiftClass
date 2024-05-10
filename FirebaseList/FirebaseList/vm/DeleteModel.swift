//
//  DeleteModel.swift
//  FirebaseList
//
//  Created by TJ on 2024/05/09.
//

import Foundation
import Firebase

struct DeleteModel{
    let db = Firestore.firestore()
    
    func deleteItems(documentId: String) -> Bool{
        var status: Bool = true
        
        db.collection("students").document(documentId).delete(){
            error in
            if error != nil{
                status = false

            }else{
            status = true
            }
        }
        return status
    }

}






