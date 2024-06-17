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
    let title: String
    @Published var isComplete: Bool
    
    init(title: String, isComplete: Bool = false) {
            self.title = title
            self.isComplete = isComplete
        }
}
