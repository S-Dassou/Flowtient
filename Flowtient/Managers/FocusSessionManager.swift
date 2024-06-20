//
//  FocusSessionManager.swift
//  Flowtient
//
//  Created by shafique dassu on 08/06/2024.
//

import Foundation
import SwiftUI
import FamilyControls
import ManagedSettings
import DeviceActivity


class FocusSessionManager: ObservableObject {
    @Published var remainingTime: Int = 0
    @Published var displayPercent: CGFloat = 0
    var totalTime: Int = 0
    var countdownTimer: Timer?
    var timeOnLeave: Date?
    
    var displayRemainingTime: String {
        let minute = Int(remainingTime) / 60 % 60
        let second = Int(remainingTime) % 60
        if remainingTime <= 59 {
            return String(format: "%02i", second )
        } else {
            return String(format: "%02i:%02i", minute, second)
        }
    }
    
    var displayTimeElapsed: String {
        let timeElapsed = totalTime - remainingTime
        let minute = Int(timeElapsed) / 60 % 60
        let second = Int(timeElapsed) % 60
        if timeElapsed <= 59 {
            return String(format: "%02i", second )
        } else {
            return String(format: "%02i:%02i", minute, second)
        }
    }
    
    func startSessionTimer() {
        self.countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.remainingTime -= 1
                strongSelf.displayPercent = CGFloat(strongSelf.totalTime - strongSelf.remainingTime) / CGFloat(strongSelf.totalTime)
                if strongSelf.remainingTime <= 0 {
                    strongSelf.stopFocusSession()
                }
            }
        }
    }
    
    func pauseSessionTimer() {
        countdownTimer?.invalidate()
        timeOnLeave = Date()
    }
    
    func stopFocusSession() {
        countdownTimer?.invalidate()
        remainingTime = 0
        totalTime = 0
    }
    
    func removeRestrictions(_ activities: [DeviceActivityName] = []) {
        let store = ManagedSettingsStore()
        store.shield.applications = nil
        store.shield.applicationCategories = nil
        store.shield.webDomainCategories = nil
        store.shield.webDomains = nil
    }
    
    func updateRemainingTime(by timeInterval: TimeInterval) {
        remainingTime -= Int(timeInterval)
        if remainingTime < 0 {
            remainingTime = 0
        }
        // Update displayPercent to reflect the change
        displayPercent = CGFloat(totalTime - remainingTime) / CGFloat(totalTime)
    }
    
    func calculateTimeDifference() {
            if let timeOnLeave = timeOnLeave {
                print("DEBUG: TimeOnLeave \(timeOnLeave)")
                let timeOnLeaveInSeconds = timeOnLeave.timeIntervalSince1970
                print("DEBUG: TimeOnLeaveInSecs \(timeOnLeaveInSeconds)")
                let timeOnReturnInSeconds = Date().timeIntervalSince1970
                print("DEBUG: TimeOnReturnInSecs \(timeOnReturnInSeconds)")
             
                let totalTimeElapsed = (timeOnReturnInSeconds - timeOnLeaveInSeconds)
                
                print("DEBUG: totalTimeElapsed \(totalTimeElapsed)")
                
                remainingTime -= Int(totalTimeElapsed)
                if remainingTime <= 0 {
                    stopFocusSession()
                } else {
                    startSessionTimer()
                }

                self.timeOnLeave = nil
            }
        }

}
