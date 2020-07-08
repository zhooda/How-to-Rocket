//
//  EngineCell.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct EngineCell: View {
    
    var engine: Engine
    
    var body: some View {
        HStack {
            Image(engine.iconName)
                .resizable()
                .renderingMode(.template)
                .padding(.all, 3.0)
                .foregroundColor(Color(.white))
                .frame(width: 35.0, height: 35.0)
                .background(engine.color)
                .cornerRadius(8.0)
            VStack(alignment: .leading) {
                Text(engine.name)
                    .font(.system(size: 18))
                Text("(\(engine.type))")
                    .font(.caption)
            }
        }
    }
}



struct EngineCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            EngineCell(engine: Engine(name: "Open Cycle", type: "Gas Chamber", iconName: "open-cycle-icon", color: .orange, description: "", usage: ""))
        }
    }
}
