//
//  QueryModel.swift
//  FirebaseList
//
//  Created by TJ on 2024/05/09.
//

import Foundation
import Firebase // <<<<<<<<<

protocol QueryModelProtocol{
    func itemDownloaded(items: [DBModel])
}

struct QueryModel{
    var delegate: QueryModelProtocol!
    let db = Firestore.firestore()
    
    func downloadItems(){
        var locations: [DBModel] = []
        
        db.collection("students")
            .order(by: "code").getDocuments(completion: {(QuerySnapshot, err) in
                if let err = err{
                    print("error documents : \(err)")
                }else{
                    print("Data is downlaoded.")
                    for document in QuerySnapshot!.documents{
                        guard let data = document.data()["code"] else {return}
                        print("\(document.documentID) => \(data)")
                        let query = DBModel(documentId: document.documentID,
                                            code: document.data()["code"] as! String,
                                            name: document.data()["name"] as! String,
                                            dept: document.data()["dept"] as! String,
                                            phone: document.data()["phone"] as! String)
                        locations.append(query)
                    }
                    DispatchQueue.main.async {
                        self.delegate.itemDownloaded(items: locations)
                    }
                }
                
            })
    }
    
}




