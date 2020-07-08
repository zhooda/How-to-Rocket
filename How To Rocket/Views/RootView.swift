//
//  RootView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab = 0
    @State private var showingAlert = true
    
    init() {
            
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().separatorStyle = .none
//        UITableView.appearance().showsVerticalScrollIndicator = false
        
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
//            NewsTabView(articles: $articles)
            NewsFeedView()
                .tabItem {
                    Image(systemName: "square.stack.fill")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 23, height: 23)
                    Text("News")
                }.tag(0)
            LearnTabView()
                .tabItem {
                    Image("open-cycle-icon")
                        .renderingMode(.template)
                    Text("Learn")
                }.tag(1)
//            PartsTabView()
//                .tabItem {
//                    Image(systemName: "hammer.fill")
//                    Text("Parts")
//                }.tag(2)
        }
        .accentColor(.red)

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
