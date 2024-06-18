//
//  IntentionModel.swift
//  Flowtient
//
//  Created by shafique dassu on 10/06/2024.
//

import Foundation
import SwiftUI

class IntentionModel: Identifiable, ObservableObject {
    let id = UUID()
    var goal: String = ""
    @Published var isComplete: Bool
    
    init(goal: String, isComplete: Bool = false) {
            self.goal = goal
            self.isComplete = isComplete
        }
}
