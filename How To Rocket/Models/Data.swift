//
//  Data.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/4/20.
//

import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
}

struct Docs: Codable {
    let docs: [Article]
}

class Api {
    
    let warningMessage = "How to Rocket is no where near completion, and is VERY buggy. It can and will crash often. To report bugs or get help, contact me at zeeshan@hooda.dev."
    
    func getArticles(completion: @escaping ([Article]) -> ()) {
        guard let url = URL(string: "https://spaceflightnewsapi.net/api/v1/articles?limit=20") else {
            return
        }
        
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
//            return
//        }
//
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let docs = try! JSONDecoder().decode(Docs.self, from: data!)
            let articles = docs.docs
            
            DispatchQueue.main.async {
                completion(articles)
            }
        }
        .resume()
    }
}
