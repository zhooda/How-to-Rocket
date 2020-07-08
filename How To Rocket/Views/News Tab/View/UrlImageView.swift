//
//  UrlImageView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/6/20.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
//            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .frame(maxHeight: 180)
//            .frame(width: 100, height: 100)
    }
    
    static var defaultImage = UIImage(named: "placeholder-img")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
