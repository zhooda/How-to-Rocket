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
    let sections = ["ENGINES", "EQUATIONS"]
    
    var body: some View {
        NavigationView {
        
//            if #available(iOS 14, *) {
//                ListWrap14(engines: engines, equations: equations, sections: sections)
//            } else {
//                ListWrap13(engines: engines, equations: equations, sections: sections)
////            }
            ListView(engines: engines, equations: equations, sections: sections)
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
        
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


//@available(iOS 14.0, *)
//struct ListWrap14: View {
//
//    var engines: [Engine]
//    var equations: [Equation]
//    var sections: [String]
//
//    var body: some View {
//        ListView(engines: engines, equations: equations, sections: sections)
//            .listStyle(InsetGroupedListStyle())
//    }
//}

////@available(iOS 13.2, *)
//struct ListWrap13: View {
//
//    var engines: [Engine]
//    var equations: [Equation]
//    var sections: [String]
//
//    var body: some View {
//        ListView(engines: engines, equations: equations, sections: sections)
////            .listStyle(GroupedListStyle())
////            .environment(\.horizontalSizeClass, .regular)
//    }
//}

struct ListView: View {
    
    var engines: [Engine]
    var equations: [Equation]
    var sections: [String]
    
    var body: some View {
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
//            .cornerRadius(13)
            .padding(.vertical, 3.0)
            
            Section(header: Text(sections[1])) {
                ForEach(equations) {equation in
                    NavigationLink(
                        //                                destination: WebView(url: "https://google.com/?q=rocket%20equation").edgesIgnoringSafeArea(.all),
                        destination: VStack {
                            Text(equation.name)
                            Text(equation.equation).italic()
                        },
                        label: {
                            EquationCell(equation: equation)
                        })
                    //                            EquationCell(equation: equation)
                }
            }
//            .cornerRadius(13)
            .padding(.vertical, 3.0)
        }
        .navigationBarTitle("📖 Learn", displayMode: .large)
    }
}


