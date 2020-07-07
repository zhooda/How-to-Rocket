////
////  NewsTabView.swift
////  How To Rocket
////
////  Created by Zeeshan Hooda on 7/3/20.
////
//
//import SwiftUI
//
//struct NewsTabView: View {
//
//    @Environment(\.colorScheme) var colorScheme
//    @Binding var articles: [Article]
//    @State var showingAlert = false
//
//    var body: some View {
//        NavigationView {
//            ScrollView(showsIndicators: false) {
//                ForEach(articles) {article in
//                    ArticleCardView(article: article)
//                }
//            }
//            .navigationBarTitle(Text("🚀 News"), displayMode: .large)
//            .navigationBarItems(trailing: Button(action: {
//                self.showingAlert.toggle()
//                self.fetchArticles()
//            }, label: {
//                Image(systemName: "arrow.clockwise.circle.fill")
//                    .imageScale(.large)
//                    .foregroundColor(.red)
//            })
//            .alert(isPresented: $showingAlert, content: {
//                Alert(title: Text("WARNING"), message: Text(Api().warningMessage), dismissButton: .destructive(Text("Got it!")))
//            })
//            )
//        }
////        .onAppear(perform: fetchArticles)
//
//    }
//
//    func fetchArticles() {
//        Api().getArticles { (articles) in
//            self.articles = articles
//        }
//    }
//}
//
//
//struct NewsTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsTabView(articles: .constant(testArticleData))
//    }
//}
