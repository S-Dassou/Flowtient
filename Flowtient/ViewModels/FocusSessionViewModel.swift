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

    
    var focusTimeHour: Int?
    var focusTimeMinute: Int?
    
//    func loadSelection() {
//            let defaults = UserDefaults.standard
//            guard let data = defaults.data(forKey: userDefaultsKey) else { return }
//            do {
//                selectionToDiscourage = try decoder.decode(FamilyActivitySelection.self, from: data)
//                //print("Load Selection / Applications Loaded")
//            } catch {
//                print("Failed to load selection: \(error)")
//            }
//            
//            store.shield.applications = selectionToDiscourage.applicationTokens.isEmpty ? nil : selectionToDiscourage.applicationTokens
//        }
//    
//    func removeRestrictions() {
//            store.shield.applications = nil
//        }
    
    func intervalDidStart() {
        
    }
}

