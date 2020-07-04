//
//  Engine.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import Foundation
import SwiftUI

struct Engine: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var iconName: String
    var color: Color
}


#if DEBUG
let testEngineData = [
    Engine(name: "Open Cycle", type: "Gas Turbine", iconName: "open-cycle-icon", color: .purple),
    Engine(name: "Closed Cycle", type: "Oxidizer Rich", iconName: "open-cycle-icon", color: .blue),
    Engine(name: "Closed Cycle", type: "Fuel Rich", iconName: "open-cycle-icon", color: .green),
    Engine(name: "Full Flow", type: "Staged Combustion Cycle", iconName: "open-cycle-icon", color: .orange)
]
#endif
