//
//  BetterSearchBar.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/7/20.
//

import SwiftUI

struct SearchBarPreview: View {
    
    @State var searchString = ""
    
    var body: some View {
        VStack {
            BetterSearchBar(text: $searchString)
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

struct SearchBarPreview_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarPreview()
    }
}

struct BetterSearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(.tertiaryLabel))
            TextField("Search", text: $text)
            Spacer(minLength: 0)
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(Color(.tertiaryLabel))
                        .frame(width: 16, height: 16)
                })
            }
        }
        .padding(5)
        .padding(.horizontal, 6)
        .background(RoundedRectangle(cornerRadius: 13.0).foregroundColor(Color(.secondarySystemFill)))
        .frame(maxWidth: .infinity)
    }
}

