//
//  QueryModel.swift
//  JSONCollectionList
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
            let movies = try decoder.decode([movieJson].self, from: data)
            for movies in movies{
                let query = SavedData(image: movies.image, title: movies.title)
                locations.append(query)
                print(movies.image)
            }
        }catch let error{
            print("Fail: \(error.localizedDescription)")
        }
        DispatchQueue.main.async {
            self.delegate.itemDownloaded(items: locations)
        }
    }
    
}
