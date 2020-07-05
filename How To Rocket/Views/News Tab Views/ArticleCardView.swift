//
//  ArticleCardView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI
import URLImage

struct ArticleCardView: View {
    
    @State var isWebViewPresented: Bool = false
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
//            Image(article.imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(8.0)
//                .frame(maxWidth: UIScreen.main.bounds.width - 32.0, maxHeight: 200)
//            URLImage(URL(string: article.featured_image)!, placeholder: Image(systemName: "hammer.fill"))
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            URLImage(URL(string: article.featured_image)!, placeholder: {_ in
                VStack {
                    Image("placeholder-img")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: 180)
                        .foregroundColor(Color(.secondarySystemFill))
                }
            }) { proxy in
                proxy.image
                    .resizable()                     // Make image resizable
                    .aspectRatio(contentMode: .fill) // Fill the frame
//                    .clipped()                      // Clip overlaping parts
                }
            .frame(maxHeight: 180)
            ZStack(alignment: .leading) {
                Color(.secondarySystemBackground)
                    .padding(.horizontal, -100000000)
                    .padding(.bottom, -1000000)
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
//            .background(Color(.secondarySystemBackground))
            
        }
        .padding(.top, 0)
        .frame(width: UIScreen.main.bounds.width - 32)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(13.0)
        .padding(.bottom, 8.0)
        .onTapGesture {
            self.isWebViewPresented.toggle()
        }
        .sheet(isPresented: $isWebViewPresented) {
            SafariView(url: URL(string: article.url)!)
//            WebView(url: article.url)
        }
//        .onTapGesture {
//            if let url = URL(string: article.url) {
//                UIApplication.shared.open(url)
//            }
//        }
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    
    static var previews: some View {
            ScrollView {
                ArticleCardView(article: Article(title: "Hello, ", url: "https://google.com", published_date: "2020-07-04T18:47:55.000Z", news_site_long: "NASA Spaceflight", featured_image: "https://mk0spaceflightnoa02a.kinstacdn.com/wp-content/uploads/2020/07/EcBaaVIWsAEfUtX.jpg"))
            }
//            .background(Color(.secondarySystemBackground))
        .preferredColorScheme(.dark)
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
