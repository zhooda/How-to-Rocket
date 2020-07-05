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
