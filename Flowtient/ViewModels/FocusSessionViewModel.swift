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
    
    func startMonitoring() {
        
        
        
        let currentDateTime = Date() //todays date
        let currentDateTimeInterval = currentDateTime.timeIntervalSince1970 //todays date as time interval
        let currentDateTimeIntervalAsInt = Int(currentDateTimeInterval) //todays date as time interval int - to add to total focus time
        
        
        let sliderValueInSeconds = (sliderValue * 60) //slider value (total time in mins) * 60
        let totalFocusTime = sliderValueInSeconds + currentDateTimeIntervalAsInt
        let totalFocusTimeDate = Date(timeIntervalSince1970: TimeInterval(totalFocusTime)) //total focus ending time as date object
        
        let calendar = Calendar.current
        let dateCommonentsStart = calendar.dateComponents([.hour, .minute], from: currentDateTime)
        let dateComponentsEnd = calendar.dateComponents([.hour, .minute], from: totalFocusTimeDate)
        
        

//        let schedule = DeviceActivitySchedule(
//            intervalStart: DateComponents(hour: dateCommonentsStart.hour, minute: dateCommonentsStart.minute),
//            intervalEnd: DateComponents(hour: dateComponentsEnd.hour, minute: dateComponentsEnd.minute),
//            repeats: true
//        )
        
        let schedule = DeviceActivitySchedule(intervalStart: Calendar.current.dateComponents([.hour, .minute], from: currentDateTime),
                                               intervalEnd: Calendar.current.dateComponents([.hour, .minute], from: totalFocusTimeDate),
                                               repeats: false
                                               )

        let center = DeviceActivityCenter()
        
        do {
            try center.startMonitoring(.activity, during: schedule)
        } catch {
            print("Error starting monitoring: \(error.localizedDescription)")
        }
        
        
    }
    
    func removeRestrictions() {
        let store = ManagedSettingsStore()
        store.shield.applications = nil
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

