//
//  ContentView.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI
import UIKit

struct LearnTabView: View {
    
    let engines = testEngineData
    let equations = testEquationData
    let sections = ["Engines", "Equations"]
    
    var body: some View {
        NavigationView {
            VStack {

                List {
                    Section(header: Text(sections[0])) {
                        ForEach(engines) {engine in
                            NavigationLink(
                                destination: EngineDetailView(engine: engine),
                                label: {
                                    EngineCell(engine: engine)
                                })
                        }
                    }
                    .padding(.vertical, 5.0)
                    
                    Section(header: Text(sections[1])) {
                        ForEach(equations) {equation in
                            NavigationLink(
                                destination: WebView(url: "https://google.com/").edgesIgnoringSafeArea(.all),
//                                destination: Text(equation.name),
                                label: {
                                    EquationCell(equation: equation)
                                })
//                            EquationCell(equation: equation)
                        }
                    }
                    .padding(.vertical, 5.0)
                }
                .listStyle(InsetGroupedListStyle())

            }
            .navigationBarTitle("Learn", displayMode: .large)
        }
        .accentColor(.red)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LearnTabView()
            .preferredColorScheme(.dark)
            
    }
}
