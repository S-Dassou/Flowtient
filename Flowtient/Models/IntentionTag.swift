//
//  IntentionTag.swift
//  Flowtient
//
//  Created by shafique dassu on 26/03/2024.
//

import Foundation
import SwiftUI

struct IntentionTag: Identifiable {
    let id: String
    let title: String
    let icon: String
}

extension IntentionTag {
    
    static let defaultIntentionTags: [IntentionTag] = [
        IntentionTag(id: "default1", title: "Work", icon: "briefcase"),
        IntentionTag(id: "default2", title: "Social", icon: "person"),
        IntentionTag(id: "default3", title: "Gym", icon: "dumbbell")
    ]
}
