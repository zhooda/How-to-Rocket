//
//  ArticleCardView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct ArticleCardView: View {
    
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .cornerRadius(8.0)
//                .frame(maxWidth: UIScreen.main.bounds.width - 32.0, maxHeight: 200)
            Text(article.headline)
                .padding(.horizontal, 10.0)
                .padding(.bottom, 10.0)
                .font(.headline)
            
        }
        .padding(.top, 0)
        .frame(width: UIScreen.main.bounds.width - 32)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(13.0)
        .padding(.bottom, 8.0)
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    
    static var previews: some View {
            ScrollView {
                ForEach(testArticleData) {article in
                    ArticleCardView(article: article)
                }
            }
//            .background(Color(.secondarySystemBackground))
//        .preferredColorScheme(.dark)
    }
}
