//
//  RootView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab = 0
    @State var articles: [Article] = []
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NewsTabView(articles: $articles)
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }.tag(0)
            LearnTabView()
                .tabItem {
                    Image("open-cycle-icon")
                        .renderingMode(.template)
                    Text("Learn")
                }.tag(1)
            PartsTabView()
                .tabItem {
                    Image(systemName: "hammer.fill")
                    Text("Parts")
                }.tag(2)
        }
        .accentColor(.red)
        .onAppear {
            Api().getArticles { (articles) in
                self.articles = articles
            }
        }
    }
    
}

struct CustomTabIcon: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .renderingMode(.template)
            .frame(width: 250, height: 250)
            .foregroundColor(.orange)
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
