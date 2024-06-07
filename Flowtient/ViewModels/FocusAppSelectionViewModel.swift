//
//  FocusAppSelectionViewModel.swift
//  Flowtient
//
//  Created by shafique dassu on 24/03/2024.
//

import Foundation
import FamilyControls
import DeviceActivity
import ManagedSettings

class FocusAppSelectionViewModel: ObservableObject {
    @Published var selectionToDiscourage = FamilyActivitySelection()
    var store = ManagedSettingsStore()
    private let encoder = PropertyListEncoder()
    private let decoder = PropertyListDecoder()
    private let userDefaultsKey = "ScreenTimeSelection"

    //function that starts the shielding once app has been selected in picker
    func setShieldRestrictions() {
        saveSelection(selection: selectionToDiscourage)
        let applications = self.selectionToDiscourage
        if applications.applicationTokens.isEmpty {
            print("empty applications list")
        }
        if applications.categoryTokens.isEmpty {
            print("empty category tokens")
        }
        store.shield.applications = applications.applicationTokens.isEmpty ? nil : applications.applicationTokens
        store.shield.applicationCategories = .specific(applications.categoryTokens)
//        store.shield.applicationCategories = applications.categoryTokens.isEmpty ? nil :  ShieldSettings.ActivityCategoryPolicy.specific(applications.categoryTokens)
    }
    
    func saveSelection(selection: FamilyActivitySelection) {
        
        let defaults = UserDefaults.standard
        do {
            let data = try encoder.encode(selection)
            defaults.set(data, forKey: userDefaultsKey)
            
            store.shield.applications = selectionToDiscourage.applicationTokens.isEmpty ? nil : selectionToDiscourage.applicationTokens
            store.shield.applicationCategories = .specific(selectionToDiscourage.categoryTokens)
            store.shield.webDomainCategories = .specific(selectionToDiscourage.categoryTokens)
            
        } catch {
            print("Failed to save selection: \(error)")
        }
    }
    
    func loadSelection() {
        let defaults = UserDefaults.standard
        guard let data = defaults.data(forKey: userDefaultsKey) else { return }
        do {
            selectionToDiscourage = try decoder.decode(FamilyActivitySelection.self, from: data)
            //print("Load Selection / Applications Loaded")
        } catch {
            print("Failed to load selection: \(error)")
        }
        
        store.shield.applications = selectionToDiscourage.applicationTokens.isEmpty ? nil : selectionToDiscourage.applicationTokens
    }
}
