//
//  DBModel.swift
//  FirebaseImageAddress
//
//  Created by 김수진 on 5/10/24.
//

import Foundation

struct DBModel{
    var documentId: String
    var name: String
    var phone: String
    var address: String
    var relation: String
    var image: String
    
    init(documentId: String, name: String, phone: String, address: String, relation: String, image: String) {
        self.documentId = documentId
        self.name = name
        self.phone = phone
        self.address = address
        self.relation = relation
        self.image = image
    }
}
