//
//  PartsTabView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct PartsTabView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("open-cycle-svg")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(52.0)
                Text("Under Construction")
                    .font(.title)
//                WebView(url: "https://google.com")
            }
        }
    }
}

struct PartsTabView_Previews: PreviewProvider {
    static var previews: some View {
        PartsTabView()
    }
}
