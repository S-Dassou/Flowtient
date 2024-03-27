//
//  DeviceActivityMonitorExtension.swift
//  Flowtient
//
//  Created by shafique dassu on 22/03/2024.
//
//
import Foundation
import DeviceActivity
import ManagedSettings
import FamilyControls

class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    let store = ManagedSettingsStore()
    let focusAppSelectionViewModel = FocusAppSelectionViewModel()
    
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        
        let applications = focusAppSelectionViewModel.selectionToDiscourage.applications
         
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        
        store.shield.applications = nil
        store.shield.applicationCategories = nil
        store.shield.webDomainCategories = nil
        store.shield.webDomains = nil
        store.clearAllSettings()
    }
}
