//
//  EngineDetailView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct EngineDetailView: View {
    
    var engine: Engine
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
//            Rectangle()
//                .foregroundColor(Color(colorScheme == .dark ? .systemBackground : .secondarySystemBackground))
//                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                EngineDetailImage(imageName: "open-cycle-svg", caption: "\(engine.name) - \(engine.type)", engine: engine)
                Spacer()
                EngineDetailText(heading: "Description", text: lorem2)
                Spacer()
                EngineDetailText(heading: "Specifications", text: lorem2)
            }
            .navigationBarTitle("\(engine.name)")
        }
        
    }
}

struct EngineDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            EngineDetailView(engine: testEngineData[1])
        }
//        .preferredColorScheme(.dark)
    }
}

struct EngineDetailImage: View {
    
    var imageName: String
    var caption: String
    var engine: Engine

    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(engine.color)
                .frame(width: 250, height: 250)
                .scaledToFit()
            Text(caption)
                .italic()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 32, height: 320)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(13.0)
        .padding(.bottom, 16.0)
    }
}

struct EngineDetailText: View {
    
    var heading: String
    var text: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(heading.uppercased())
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
                .padding(.leading, 16.0)
                .padding(.bottom, 8.0)
            VStack {
                Text(text)
                    .multilineTextAlignment(.leading)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(13.0)
        }
        .padding(.bottom, 16.0)
    }
}

#if DEBUG
let lorem = "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Non, saepe ex. Eum dolores provident ipsam unde repellat alias amet minima veritatis numquam. \n\nAsperiores harum placeat expedita officia recusandae perferendis cum facilis beatae aut ea aliquam ad, voluptatem commodi sed ex ipsa natus architecto saepe. Voluptas quis vitae dicta! Fugit excepturi quam fugiat quo quisquam velit accusantium libero. \n\nIncidunt quas iste totam provident consequatur? Assumenda voluptates omnis quo odit nostrum hic quisquam. Molestiae molestias reprehenderit nam sapiente, facilis, incidunt voluptates porro harum deserunt laudantium eum aliquid, accusamus voluptatum dolorum assumenda laboriosam. \n\nIpsum neque, aliquam eum accusantium facere, eligendi labore est nobis ratione alias, doloribus animi officia dignissimos esse quo cupiditate. Magni odit cupiditate neque perspiciatis ipsam mollitia distinctio impedit, illo excepturi!"

let lorem2 = "Incidunt quas iste totam provident consequatur? Assumenda voluptates omnis quo odit nostrum hic quisquam. Molestiae molestias reprehenderit nam sapiente, facilis, incidunt voluptates porro harum deserunt laudantium eum aliquid, accusamus voluptatum dolorum assumenda laboriosam. \n\nIpsum neque, aliquam eum accusantium facere, eligendi labore est nobis ratione alias, doloribus animi officia dignissimos esse quo cupiditate. Magni odit cupiditate neque perspiciatis ipsam mollitia distinctio impedit, illo excepturi!"
#endif
