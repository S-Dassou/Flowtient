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
    
    func startMonitoring() {
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59),
            repeats: true
        )

        let center = DeviceActivityCenter()
        
        do {
            try center.startMonitoring(.daily, during: schedule)
        } catch {
            print("Error starting monitoring: \(error.localizedDescription)")
        }
    }
    
    func setShieldRestrictions() {
        saveSelection(selection: selectionToDiscourage)
        let applications = self.selectionToDiscourage
        if applications.applicationTokens.isEmpty {
            print("empty applications list")
        }
        store.shield.applications = applications.applicationTokens.isEmpty ? nil : applications.applicationTokens
        store.shield.applicationCategories = applications.categoryTokens.isEmpty ? nil :  ShieldSettings.ActivityCategoryPolicy.specific(applications.categoryTokens)
    }
    
    func saveSelection(selection: FamilyActivitySelection) {
            
            let defaults = UserDefaults.standard
            do {
                let data = try encoder.encode(selection)
                defaults.set(data, forKey: userDefaultsKey)
                //print("Save Selection / Applications Saved")
                
                store.shield.applications = selectionToDiscourage.applicationTokens.isEmpty ? nil : selectionToDiscourage.applicationTokens
            } catch {
                print("Failed to save selection: \(error)")
            }
        }
    
   
}
