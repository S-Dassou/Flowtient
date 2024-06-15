//
//  ContentView.swift
//  Flowtient
//
//  Created by shafique dassu on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    /*
     - timer: counting down from the time set in FocusTimeSetView
     - Progress Bar
     - Button to end the focus session 
     */
    
    @StateObject var dayTimerManager = DayTimerManager()
    @StateObject var focusSessionNavigationViewModel = FocusSessionNavigationViewModel()
    @StateObject var focusSessionViewModel = FocusSessionViewModel()
    @Environment(FocusSessionManager.self) var focusSessionManager

    var body: some View {
        @Bindable var focusSessionManager = focusSessionManager
        VStack {

            //timer for the day's hours - spanning wake up to sleep - when timer = 0 : Moon Image
            //mock data - start at 8am finish at 10pm
            ProgressRing(progress: 0.5)
            
            HStack(spacing: 60) {
                //MARK: Start Time
                VStack(spacing: 5) {
                    Text("Wake Up")
                        .opacity(0.7)
                    
                    Text(dayTimerManager.startTime, format: .dateTime.weekday().hour().minute().second())
                        .fontWeight(.bold)
                }
                
                //MARK: End Time
                VStack(spacing: 5) {
                    Text("Sleep")
                        .opacity(0.7)
                    
                    Text(dayTimerManager.endTime, format: .dateTime.weekday().hour().minute().second())
                        .fontWeight(.bold)
                }
                
            }
            

//            HStack {
//                Text("Total Pickups: 5")
//                Text("||")
//                Text("Total Screentime: 5h30m")
//            }
            
            PrimaryButton(title: "Start Focus Mode") {
                focusSessionNavigationViewModel.navigateToFocusMode = true
            }
            
            //timer
          //  if focusSessionManager.countdownTimer != nil {
        
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                    
                    VStack {
                        
                        Text(focusSessionManager.displayTime)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 30, weight: .semibold))
                            .padding()
                        
                        FocusSessionProgressBar(percent: $focusSessionManager.displayPercent)
                            .padding()
                        
                        VStack {
                            ForEach(focusSessionViewModel.intentions) { intention in
                                List {
                                    Text(intention.title)
                                }
                            }
                        }
                        
                        PrimaryButton(title: "End Focus Session") {
                            /*
                             - clear out managed settings store
                             - invalidate timer
                             */
                            focusSessionViewModel.center.stopMonitoring()
                            focusSessionManager.removeRestrictions()
                            focusSessionManager.stopFocusSession()
                        }
                    }
                    //   }
                }
                .frame(width: UIScreen.main.bounds.width / 1.2)
            
        }
        .fullScreenCover(isPresented: $focusSessionNavigationViewModel.navigateToFocusMode, content: {
            FocusTimeSetView(focusSessionViewModel: focusSessionViewModel, focusSessionNavigationViewModel: focusSessionNavigationViewModel)
        })
    }
}

#Preview {
        ContentView()
        .environment(FocusSessionManager())
}
