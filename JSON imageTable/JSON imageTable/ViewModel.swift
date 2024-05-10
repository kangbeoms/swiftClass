//
//  ViewModel.swift
//  JSON imageTable
//
//  Created by TJ on 2024/05/07.
//

import Foundation

protocol QueryModelProtocol{
    func itemDownloaded(items: [SavedData])
    
}

struct QueryModel{
    var delegate: QueryModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/movies.json"
    
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
        var locations: [SavedData] = []
        do{
            let movies = try decoder.decode([JSONList].self, from: data)
            for movies in movies{
                let query = SavedData(image: movies.image, title: movies.title)
                print(movies.image)
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



