//
//  Equation.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import Foundation
import SwiftUI

struct Equation: Identifiable {
    var id = UUID()
    var name: String
    var equation: String
    var iconName: String
    var color: Color
}


//#if DEBUG
let testEquationData = [
    Equation(name: "Gravitation", equation: "F = GmM/r^2", iconName: "percent", color: .yellow),
    Equation(name: "Work", equation: "W = Fdcosθ", iconName: "function", color: .gray),
    Equation(name: "Velocity", equation: "v = 0.5mv^2", iconName: "number", color: .red),
    Equation(name: "The Rocket Equation", equation: "F = ma", iconName: "sum", color: .orange),
]
//#endif
