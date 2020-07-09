//
//  NewsFeedView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/6/20.
//

import SwiftUI
import SwiftUIRefresh

struct NewsFeedView: View {
    @ObservedObject var newsFeed = NewsFeed()
    
    @ObservedObject var searchBar: SearchBar = SearchBar()
    
    @State var isShowing = false
    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                
                
                ForEach(newsFeed.newsListItems.filter {
                    self.searchBar.text.isEmpty ? true: $0.title.localizedCaseInsensitiveContains(self.searchBar.text)
                }) { article in
                    VStack {
                        NewsListItemListView(article: article)
    //                                .edgesIgnoringSafeArea(.all)
                                    .onAppear {
                                        self.newsFeed.loadMoreArticles(currentItem: article)
                                }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 32))
                }
            }
            .pullToRefresh(isShowing: $isShowing) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.newsFeed.refresh()
                    self.isShowing = false
                }
            }
            .listStyle(PlainListStyle())
            .id(UUID())
            .navigationBarTitle("🚀 News")
            .add(self.searchBar)
            .navigationBarItems(trailing: Text(""))
        }
    }

}

struct NewsListItemView: View {
    var article: NewsListItem
    
    var body: some View {
        SafariView(url: URL(string: article.url)!)
    }
}

struct NewsListItemListView: View {
    @State var isWebViewPresented = false
    
    var article: NewsListItem
    var timeSincePublished: String
    
    var formatter = DateFormatter()
    
    init(article: NewsListItem) {
        self.article = article
        self.formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = self.formatter.date(from: article.published_date)!
        self.timeSincePublished = date.timeAgoSinceDate()
    }
    
    var body: some View {
        VStack {
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
                        Text(article.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 12.0)
                            .padding(.bottom, 10.0)
//                            .font(.headline)
                            .font(Font.custom("New York", size: 18))
                            .lineLimit(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding(.top, 0)
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(13.0)
            .onTapGesture {
                    self.isWebViewPresented.toggle()
            }
            .sheet(isPresented: self.$isWebViewPresented) {
                NewsListItemView(article: self.article)
            }
            .padding(.top, 10)
            
            HStack {
                Image(systemName: "clock.fill")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(.leading, 10)
                    .padding(.trailing, -5)
                Text(self.timeSincePublished)
                    .foregroundColor(Color(.secondaryLabel))
                    .bold()
                    .padding(.trailing, 10)
                    .cornerRadius(13.0)
                    .font(.caption)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 32)
        }
        .padding(.bottom, 0.0)
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}

extension Date {

    func timeAgoSinceDate() -> String {

        // From Time
        let fromDate = self

        // To Time
        let toDate = Date()

        // Estimation
        // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {

            return interval == 1 ? "\(interval)" + " " + "year ago" : "\(interval)" + " " + "years ago"
        }

        // Month
        if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {

            return interval == 1 ? "\(interval)" + " " + "month ago" : "\(interval)" + " " + "months ago"
        }

        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {

//            return interval == 1 ? "\(interval)" + " " + "day ago" : "\(interval)" + " " + "days ago"
            return interval == 1 ? "\(interval)" + "d ago" : "\(interval)" + "d ago"
        }

        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {

//            return interval == 1 ? "\(interval)" + " " + "hour ago" : "\(interval)" + " " + "hours ago"
            return interval == 1 ? "\(interval)" + "h ago" : "\(interval)" + "h ago"
        }

        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {

//            return interval == 1 ? "\(interval)" + " " + "minute ago" : "\(interval)" + " " + "minutes ago"
            return interval == 1 ? "\(interval)" + "m ago" : "\(interval)" + "m ago"
        }

        return "just now"
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
