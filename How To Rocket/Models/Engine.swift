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
    
    var description: String
    var usage: String
}


//#if DEBUG
let testEngineData = [
    Engine(name: "Gas-Generator", type: "Open Combustion Cycle", iconName: "open-cycle-icon", color: .purple, description: "The gas-generator cycle is a power cycle of a bipropellant rocket engine. Some of the propellant is burned in a gas generator and the resulting hot gas is used to power the engine's pumps. The gas is then exhausted. Because something is \"thrown away\" this type of engine is also known as open cycle.\n\nThere are several advantages to the gas-generator cycle over its counterpart, the staged combustion cycle. The gas generator turbine does not need to deal with the counter pressure of injecting the exhaust into the combustion chamber. This simplifies plumbing and turbine design, and results in a less expensive and lighter engine.\n\nThe main disadvantage is lost efficiency due to discarded propellant. Gas-generator cycles tend to have lower specific impulse than staged combustion cycles. However, there are forms of the gas-generator cycle that recycle the exhaust into the nozzle of the rocket engine. This is seen in the F-1 rocket engine used on the Saturn V booster stage.", usage: "Gas-generator combustion engines include the following:\n\n- Vulcain, HM7B\n- Merlin\n- RS-68\n- RS-27A\n- J-2X\n- F-1\n- RD-107\n- CE-20\n\nRocket launch systems that use gas-generator combustion engines:\n\n- Ariane 5\n- Falcon 9, Falcon Heavy\n- Delta IV\n- Saturn V\n- Soyuz (rocket family)\n- Geosynchronous Satellite Launch Vehicle III\n- Long March 3B, Long March 2F"),
    Engine(name: "Oxidizer or Fuel Rich", type: "Staged Combustion Cycle", iconName: "open-cycle-icon", color: .blue, description: "The staged combustion cycle (sometimes known as topping cycle or preburner cycle) is a power cycle of a bipropellant rocket engine. In the staged combustion cycle, propellant flows through multiple combustion chambers, and is thus combusted in stages. The main advantage relative to other rocket engine power cycles is high fuel efficiency, measured through specific impulse, while its main disadvantage is engineering complexity.\n\nTypically, propellant flows through two kinds of combustion chambers; the first called preburner and the second called main combustion chamber. In the preburner, a small portion of propellant is combusted, and the increasing volume flow is used to drive the turbopumps that feed the engine with propellant. In the main combustion chamber, the propellants are combusted completely to produce thrust.\n\nThe fuel efficiency of the staged combustion cycle is in part a result of all propellant ultimately flowing to the main combustion chamber; contributing to thrust. The staged combustion cycle is sometimes referred to as closed cycle, as opposed to the gas generator, or open cycle where a portion of propellant never reaches the main combustion chamber. The engineering complexity is partly a result of the preburner exhaust of hot and highly pressurized gas which, particularly when oxidizer-rich, produces extremely harsh conditions for turbines and plumbing.", usage: "Oxidizer-rich staged combustion\n\n- S1.5400\n- NK-33\n- P111\n- RD-170, 171, RD-180 and RD-191\n- YF-100\n- AR-1\n- BE-4\n- RD-253\n- SCE-200\n- Ursa Major Hadley\n\nFuel-rich staged combustion\n\n- RS-25\n- RD-0120\n- LE-7\n- KVD-1\n- CE-7.5"),
    Engine(name: "Full Flow", type: "Staged Combustion Cycle", iconName: "open-cycle-icon", color: .orange, description: "Full-flow staged combustion (FFSC) is a twin-shaft staged combustion cycle that uses both oxidizer-rich and fuel-rich preburners. The cycle allows full flow of both propellants through the turbines; hence the name. The fuel turbopump is driven by the fuel-rich preburner, and the oxidizer turbopump is driven by the oxidizer-rich preburner.\n\nBenefits of the full-flow staged combustion cycle include turbines that run cooler and at lower pressure, due to increased mass flow, leading to a longer engine life and higher reliability. As an example, up to 25 flights were anticipated for an engine design studied by the DLR (German Aerospace Center) in the frame of the SpaceLiner project, up to 1000 flights are expected for Raptor from SpaceX. Further, the full-flow cycle eliminates the need for an interpropellant turbine seal normally required to separate oxidizer-rich gas from the fuel turbopump or fuel-rich gas from the oxidizer turbopump, thus improving reliability.\n\nSince the use of both fuel and oxidizer preburners results in full gasification of each propellant before entering the combustion chamber, FFSC engines belong to a broader class of rocket engines called gas-gas engines. Full gasification of components leads to faster chemical reactions in the combustion chamber, which improves performance.", usage: "- USSR RD-27\n- USAF Integrated Powerhead Demonstrator\n- SpaceX Raptor")
]
//#endif
