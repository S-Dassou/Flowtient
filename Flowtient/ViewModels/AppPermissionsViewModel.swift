//
//  AppPermissionsViewModel.swift
//  Flowtient
//
//  Created by shafique dassu on 17/03/2024.
//

import Foundation
import SwiftUI
import FamilyControls
import ManagedSettings

class AppPermissionsViewModel: ObservableObject {

    var store = ManagedSettingsStore()
    @Published var selectionToDiscourage = FamilyActivitySelection()
    
    init(selectionToDiscourage: FamilyActivitySelection) {
        self.selectionToDiscourage = selectionToDiscourage
    }
    
    func setShieldRestrictions() {
        let applications = self.selectionToDiscourage
        if applications.applicationTokens.isEmpty {
            print("empty applications list")
        }
        store.shield.applications = applications.applicationTokens.isEmpty ? nil : applications.applicationTokens
        store.shield.applicationCategories = applications.categoryTokens.isEmpty ? nil :  ShieldSettings.ActivityCategoryPolicy.specific(applications.categoryTokens)
    }
}

