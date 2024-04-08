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

//able to shield apps without device activity monitor extension
class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    let store = ManagedSettingsStore()
    let focusAppSelectionViewModel = FocusAppSelectionViewModel()
    
//    override func intervalDidStart(for activity: DeviceActivityName) {
//        super.intervalDidStart(for: activity)
//        store.clearAllSettings()
//        let applications = focusAppSelectionViewModel.selectionToDiscourage.applications
//         
//    }
//    
//    override func intervalDidEnd(for activity: DeviceActivityName) {
//        super.intervalDidEnd(for: activity) //ends when actvity reaches its threshold 
//        
//        store.shield.applications = nil
//        store.shield.applicationCategories = nil
//        store.shield.webDomainCategories = nil
//        store.shield.webDomains = nil
//        store.clearAllSettings()
//    }
//    
//    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
//        super.eventDidReachThreshold(event, activity: activity)
//        store.clearAllSettings()
//        store.shield.applications = nil
//        store.shield.applicationCategories = nil
//        store.shield.webDomainCategories = nil
//        store.shield.webDomains = nil
//    }
}

//trick app into less than 15 minutes -
//device activity monitor requires 15 minutes to run without error
//scheduled time must be 15 minutes
//if scheduled time < 15 minutes {
//pass 15 minutes into schedule
//pass chosen time into timer (e.g. 3)
//when timer hits 3, end timer

