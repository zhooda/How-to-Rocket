//
//  NewsFeedModels.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/6/20.
//

import Foundation

class NewsFeed: ObservableObject, RandomAccessCollection {
    typealias Element = NewsListItem
    
    @Published var newsListItems = [NewsListItem]()
    
    var startIndex: Int { newsListItems.startIndex }
    var endIndex: Int { newsListItems.endIndex }
    var loadStatus = LoadStatus.ready(nextPage: 1)
    
//    var urlBase = "https://newsapi.org/v2/everything?q=apple&apiKey=6ffeaceffa7949b68bf9d68b9f06fd33&language=en&page="
    
    var urlBase = "https://spaceflightnewsapi.net/api/v1/articles?limit=200&page="
    
    init() {
        loadMoreArticles()
    }
    
    func empty() {
        self.newsListItems = [NewsListItem]()
    }
    
    func refresh() {
        
        self.loadStatus = LoadStatus.ready(nextPage: 1)
        self.newsListItems = [NewsListItem]()
        self.loadMoreArticles()
    }
    
    subscript(position: Int) -> NewsListItem {
        return newsListItems[position]
    }
    
    func loadMoreArticles(currentItem: NewsListItem? = nil) {
        
        if !shouldLoadMoreData(currentItem: currentItem) {
            return
        }
        guard case let .ready(page) = loadStatus else {
            return
        }
        loadStatus = .loading(page: page)
        let urlString = "\(urlBase)\(page)"
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: parseArticlesFromResponse(data:response:error:))
        task.resume()
    }
    
    func shouldLoadMoreData(currentItem: NewsListItem? = nil) -> Bool {
        guard let currentItem = currentItem else {
            return true
        }
        
        for n in (newsListItems.count - 4)...(newsListItems.count-1) {
            if n >= 0 && currentItem.uuid == newsListItems[n].uuid {
                return true
            }
        }
        return false
    }
    
    func parseArticlesFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            loadStatus = .parseError
            return
        }
        guard let data = data else {
            print("No data found")
            loadStatus = .parseError
            return
        }
        
        let newArticles = parseArticlesFromData(data: data)
        DispatchQueue.main.async {
            self.newsListItems.append(contentsOf: newArticles)
            if newArticles.count == 0 {
                self.loadStatus = .done
            } else {
                guard case let .loading(page) = self.loadStatus else {
                    fatalError("loadSatus is in a bad state")
                }
                self.loadStatus = .ready(nextPage: page + 1)
            }
        }
    }
    
    func parseArticlesFromData(data: Data) -> [NewsListItem] {
        var response: NewsApiResponse
        do {
            response = try JSONDecoder().decode(NewsApiResponse.self, from: data)
        } catch {
            print("Error parsing the JSON: \(error)")
            return []
        }
        
        if response.hasNextPage != true {
            print("Response has next page: \(response.hasNextPage)")
            return []
        }
        
        return response.docs ?? []
    }
    
    enum LoadStatus {
        case ready (nextPage: Int)
        case loading (page: Int)
        case parseError
        case done
    }
}

class NewsApiResponse: Codable {
//    var status: String
    var docs: [NewsListItem]?
    var hasNextPage: Bool
}

class NewsListItem: Identifiable, Codable {
    var uuid = UUID()
    
    var news_site_long: String
    var title: String
    var featured_image: String?
    var url: String
    var published_date: String
    
    enum CodingKeys: String, CodingKey {
        case news_site_long, title, featured_image, url, published_date
    }
}
