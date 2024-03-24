//
//  AppPermissionsViewModel.swift
//  Flowtient
//
//  Created by shafique dassu on 17/03/2024.
//https://stackoverflow.com/questions/78054798/unable-to-get-deviceactivitymonitor-to-shield-apps-at-schedule

import Foundation
import SwiftUI
import FamilyControls
import ManagedSettings
import DeviceActivity

class FocusSessionViewModel: ObservableObject {

    @Published var selectionToDiscourage = FamilyActivitySelection()
    var store = ManagedSettingsStore()
    private let userDefaultsKey = "ScreenTimeSelection"
    private let encoder = PropertyListEncoder()
    private let decoder = PropertyListDecoder()
    
    init(selectionToDiscourage: FamilyActivitySelection) {
        self.selectionToDiscourage = selectionToDiscourage
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
    
    func removeRestrictions() {
            store.shield.applications = nil
        }
    
    func intervalDidStart() {
        
    }
}

