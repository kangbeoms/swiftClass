//
//  StudentsDB.swift
//  SQLite
//
//  Created by TJ on 2024/05/07.
//

import Foundation
import SQLite3

protocol QueryModelProtocol{
    func itemDownloaded(items: [Students])
}


class StudentsDB{
    var db: OpaquePointer?
    var studentList: [Students] = []
    var delegate: QueryModelProtocol!
    
    init(){
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: "StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path(percentEncoded: true), &db) != SQLITE_OK{
            print("디비 여는데 에러")
        }
        // Table 만들기
        if sqlite3_exec(db, "CREATE TABLE If NOT EXISTS students (sid integer primary key autoincrement, sname text , sdept text , sphone text)", nil, nil, nil) != SQLITE_OK{
                let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("테이블 생성 오류: \(errMsg)")
        }
    }
    func queryDB(){
        var stmt: OpaquePointer?
        let queryString = "select * from students"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
        print("셀렉트중 에러: \(errMsg)")
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = Int(sqlite3_column_int(stmt, 0))
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept  = String(cString: sqlite3_column_text(stmt, 2))
            let phone  = String(cString: sqlite3_column_text(stmt, 3))
            
            studentList.append(Students(id: id, name: name, dept: dept, phone: phone))
        }
        delegate.itemDownloaded(items: studentList)
    }
    
    func insertDB(name: String, dept: String, phone: String) -> Bool{
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        let queryString = "insert into students (sname, sdept, sphone) values (?,?,?)"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        sqlite3_bind_text(stmt, 1, name, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 2, dept, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, phone, -1, SQLITE_TRANSIENT)
        
        if sqlite3_step(stmt) == SQLITE_DONE{
            return true
        }else{
            return false
        }
        
    }
    
    func UpdateDB(id: Int, name: String, dept: String, phone: String) -> Bool{
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        let querString = "update students set sname=?, sdept=?, sphone=? where sid=?"
        sqlite3_prepare(db, querString, -1, &stmt, nil)
        
      
        sqlite3_bind_text(stmt, 1, name, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 2, dept, -1, SQLITE_TRANSIENT)
        sqlite3_bind_text(stmt, 3, phone, -1, SQLITE_TRANSIENT)
        sqlite3_bind_int(stmt, 4, Int32(id))
        
        if sqlite3_step(stmt) == SQLITE_DONE{
            return true
        }else{
            return false
        }
    }
    
    
    func DeleteDB(id: Int) -> Bool{
        var stmt: OpaquePointer?
            let queryString = "delete from students where sid=?"
        
        sqlite3_prepare(db, queryString, -1, &stmt, nil)
        
        sqlite3_bind_int(stmt, 1, Int32(id))
        
        if sqlite3_step(stmt) == SQLITE_DONE{
            return true
        }else{
            return false
        }
    }
    
    
}
