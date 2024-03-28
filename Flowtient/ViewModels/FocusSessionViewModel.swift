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
    
    @Published var sliderValue: Int = 0 //total time in minutes
    var timer: Timer?
    
    func removeRestrictions(_ activities: [DeviceActivityName] = []) {
        
        let store = ManagedSettingsStore()
        store.shield.applications = nil
    }
    
    func startMonitoring() {
        
        let currentDateTime = Date() //todays date
        // Assuming 'sliderValue' is an integer representing the time chosen by the user in minutes
        let sliderValueInMinutes = sliderValue // The slider value in minutes
        
        if let totalFocusEndTime = Calendar.current.date(byAdding: .minute, value: sliderValueInMinutes, to: currentDateTime) {
            // 'totalFocusEndTime' is the end time of the focus period
            
            // Extract the start and end date components for the schedule
            let dateComponentsStart = Calendar.current.dateComponents([.hour, .minute], from: currentDateTime)
            let dateComponentsEnd = Calendar.current.dateComponents([.hour, .minute], from: totalFocusEndTime)
            
            print("Interval Start: \(dateComponentsStart.hour!):\(dateComponentsStart.minute!)")
            print("Interval End: \(dateComponentsEnd.hour!):\(dateComponentsEnd.minute!)")
            
            // Create the schedule using the start and end date components
            let schedule = DeviceActivitySchedule(
                intervalStart: dateComponentsStart,
                intervalEnd: dateComponentsEnd,
                repeats: false
            )
            
            let center = DeviceActivityCenter()
            
            do {
                try center.startMonitoring(.activity, during: schedule)
//                // Schedule the timer to stop shielding apps at the end of the focus session
//                timer?.invalidate() // Invalidate any existing timer
//                timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(sliderValueInMinutes * 60), repeats: false) { [weak self] _ in
//                    self?.removeRestrictions()
                    center.stopMonitoring()
//                }
            } catch {
                print("Error starting monitoring: \(error.localizedDescription)")
            }
        }
    }
    
    
    
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

