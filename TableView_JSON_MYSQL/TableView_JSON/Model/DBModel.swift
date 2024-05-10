//
//  DBModel.swift
//  TableView_JSON
//
//  Created by TJ on 2024/05/03.
//

import Foundation


struct DBmodel{
    var scode: String
    var sname: String
    var sdept: String
    var sphone: String
    var saddress: String
    
    init(scode: String, sname: String, sdept: String, sphone: String, saddress: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
        self.saddress = saddress
    }
}

