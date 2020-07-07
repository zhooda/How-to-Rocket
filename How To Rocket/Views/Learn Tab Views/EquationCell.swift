//
//  EquationCell.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import SwiftUI

struct EquationCell: View {
    
    var equation: Equation
    
    var body: some View {
        HStack {
            Image(systemName: equation.iconName)
                .foregroundColor(Color(.white))
                .font(.body)
                .frame(width: 35.0, height: 35.0)
                .background(equation.color)
                .cornerRadius(8.0)
            VStack(alignment: .leading) {
                Text(equation.name)
                    .font(.system(size: 18))
                Text("\(equation.equation)")
                    .font(.caption)
                    .italic()
            }
        }
    }
}



struct EquationCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            EquationCell(equation: Equation(name: "Open Cycle", equation: "Gas Chamber", iconName: "flame", color: .orange))
        }
    }
}
