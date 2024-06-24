//
//  FocusIntentionSetViewModel.swift
//  Flowtient
//
//  Created by shafique dassu on 26/03/2024.
//

import Foundation
import SwiftUI

class FocusIntentionSetViewModel: ObservableObject {
    @Published var goalOne: String = ""
    @Published var goalTwo: String = ""
    @Published var textFieldArray: [IntentionModel] = [IntentionModel(goal: "")]

    func deleteItem(at index: Int) {
        textFieldArray.remove(at: index)
    }
    
    func addTextField() {
        textFieldArray.append(IntentionModel(goal: ""))
    }
}
