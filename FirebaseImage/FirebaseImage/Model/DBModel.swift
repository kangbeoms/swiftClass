//
//  DBModel.swift
//  FirebaseImage
//
//  Created by TJ on 2024/05/10.
//

import Foundation
import UIKit

struct Address{
    var id: Int
    var name: String
    var phone: String
    var address: String
    var relation: String
    var image: UIImage

    init(id: Int, name: String, phone: String, address: String, relation: String, image: UIImage) {
        self.id = id
        self.name = name
        self.phone = phone
        self.address = address
        self.relation = relation
        self.image = image
    }
}
