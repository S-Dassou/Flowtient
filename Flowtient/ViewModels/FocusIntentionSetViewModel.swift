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
    @Published var textFieldArray: [IntentionTextFieldRow] = [IntentionTextFieldRow()]
//    @Published var intentionTags: [IntentionIconCircleButton] = [IntentionIconCircleButton(imageName: "person", title: "social"), IntentionIconCircleButton(imageName: "briefcase", title: "work"), IntentionIconCircleButton(imageName: "lock.display", title: "iOS")]
//    
    @Published var intentionTags: [IntentionTag] = IntentionTag.defaultIntentionTags //array of intention tags containing all selected/unselected tags (currently 3 defaults)
    @Published var selectedIntentionTags: [IntentionTag] = []
    @Published var navigateToAppPermissionsView = false
    
    func addTextField() {
        textFieldArray.append(IntentionTextFieldRow())
    }
    
    func selectIntentionTag() {
        
    }
    
    func addIntentionTag() {
        //to do
    }
    
}
