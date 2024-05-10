//
//  QueryModel.swift
//  TableView_JSON
//
//  Created by TJ on 2024/05/03.
//

import Foundation


protocol QueryModelProtocol{
    func itemDownloaded(items: [DBmodel])
    
}

struct QueryModel{
    var delegate: QueryModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/student.json"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.parseJSON(data!)
            }
        }
    }
    
    func parseJSON(_ data:Data){
        let decoder = JSONDecoder()
        var locations: [DBmodel] = []
        do{
            let students = try decoder.decode([StudentJSON].self, from: data)
            for student in students{
                let query = DBmodel(scode: student.code, sname: student.name, sdept: student.dept, sphone: student.phone)
                locations.append(query)
            }
        }catch let error{
            print("Fail: \(error.localizedDescription)")
        }
        DispatchQueue.main.async {
            self.delegate.itemDownloaded(items: locations)
        }
    }
    
}

