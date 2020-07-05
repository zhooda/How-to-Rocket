//
//  NewsTabView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct NewsTabView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var articles: [Article]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(articles) {article in
                    ArticleCardView(article: article)
                }
            }
            .navigationBarTitle("🚀 News", displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                fetchArticles()
            }, label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(.red)
            }))
        }
//        .onAppear(perform: fetchArticles)

    }
    
    func fetchArticles() {
        Api().getArticles { (articles) in
            self.articles = articles
        }
    }
}


struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articles: .constant(testArticleData))
    }
}
