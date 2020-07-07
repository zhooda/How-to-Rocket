//
//  NewsFeedView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/6/20.
//

import SwiftUI

struct NewsFeedView: View {
    @ObservedObject var newsFeed = NewsFeed()
    
    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        NavigationView {
            List(newsFeed) { (article: NewsListItem) in
//                NavigationLink(destination: NewsListItemView(article: article)) {
                    NewsListItemListView(article: article)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            self.newsFeed.loadMoreArticles(currentItem: article)
                        }
//                }
            }
            .navigationBarTitle("News")
        }
    }
}

struct NewsListItemView: View {
    var article: NewsListItem
    
    var body: some View {
//        UrlWebView(urlToDisplay: URL(string: article.url)!)
//            .edgesIgnoringSafeArea(.all)
//            .navigationBarTitle(article.title)
        SafariView(url: URL(string: article.url)!)
    }
}

struct NewsListItemListView: View {
    var article: NewsListItem
    @State var isWebViewPresented = false
    
    var body: some View {
        VStack {
            UrlImageView(urlString: article.featured_image)
            
            ZStack(alignment: .leading) {
                Color(.secondarySystemBackground)
                    .cornerRadius(0)
                VStack(alignment: .leading) {
                    Text("\(article.news_site_long)")
                        .bold()
                        .font(.caption)
                        .padding(.horizontal, 10.0)
                        .padding(.bottom, 2.0)
                        .padding(.top, 8.0)
                        .foregroundColor(.red)
                    Text(article.title.uppercased())
                        .fontWeight(.black)
                        .fontWeight(.black)
                        .padding(.horizontal, 10.0)
                        .padding(.bottom, 5.0)
                        .font(.headline)
                    Text(article.published_date.UTCToLocal(incomingFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", outGoingFormat: "MMMM d, h:mm a"))
                        .foregroundColor(Color(.secondaryLabel))
                        .bold()
                        .padding(.horizontal, 10.0)
                        .padding(.bottom, 10.0)
                        .font(.caption)
                }
            }
            
//            VStack(alignment: .leading) {
//                Text("\(article.title)")
//                    .font(.headline)
//                Text("\(article.news_site_long ?? "No Author")")
//                    .font(.subheadline)
//            }
        }
        .padding(.top, 0)
        .frame(width: UIScreen.main.bounds.width - 32)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(13.0)
        .padding(.bottom, 8.0)
        .onTapGesture {
                self.isWebViewPresented.toggle()
        }
        .sheet(isPresented: self.$isWebViewPresented) {
            NewsListItemView(article: self.article)
        }
        .padding(.top, 10)
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}

extension String {

  //MARK:- Convert UTC To Local Date by passing date formats value
  func UTCToLocal(incomingFormat: String, outGoingFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = incomingFormat
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

    let dt = dateFormatter.date(from: self)
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = outGoingFormat

    return dateFormatter.string(from: dt ?? Date())
  }

  //MARK:- Convert Local To UTC Date by passing date formats value
  func localToUTC(incomingFormat: String, outGoingFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = incomingFormat
    dateFormatter.calendar = NSCalendar.current
    dateFormatter.timeZone = TimeZone.current

    let dt = dateFormatter.date(from: self)
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.dateFormat = outGoingFormat

    return dateFormatter.string(from: dt ?? Date())
  }
}
