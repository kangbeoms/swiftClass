//
//  QueryModel.swift
//  JSONtableView_Quiz
//
//  Created by TJ on 2024/05/03.
//

import Foundation

struct DBmodel{
    var scode: String
    var sname: String
    var sdept: String
    var sphone: String
    
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
}
