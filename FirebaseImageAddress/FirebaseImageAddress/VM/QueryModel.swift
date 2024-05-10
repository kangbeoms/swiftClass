//
//  QueryModel.swift
//  FirebaseImageAddress
//
//  Created by 김수진 on 5/10/24.
//

import Foundation
import Firebase //<<<<

protocol QueryModelProtocol{
    func itemDownLoaded(items: [DBModel])
}
struct QueryModel{
    var delegate: QueryModelProtocol!
    let db = Firestore.firestore()
    
    func downloadItems(){
        var locations: [DBModel] = []
        
        db.collection("addressLists")
            .order(by: "name")
            .getDocuments(completion: {
                (querySnapshot, err) in
                   if let err = err{
                        print("Error getting document : \(err)")
                    }else{
                        print("Data is downloaded.")
                        for document in querySnapshot!.documents{
                            guard let data = document.data()["name"] else {return}
                            let query = DBModel(documentId: document.documentID,
                                                name: document.data()["name"] as! String,
                                                phone: document.data()["phone"] as! String,
                                                address: document.data()["address"] as! String,
                                                relation: document.data()["relation"] as! String,
                                                image: document.data()["image"] as! String)
                            locations.append(query)
                        }
                        DispatchQueue.main.async{
                            self.delegate.itemDownLoaded(items: locations)
                        }
                    }
            })
    }
}
