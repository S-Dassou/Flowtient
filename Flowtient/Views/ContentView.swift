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
    
    //when timer hits 0 --> present modal view --> on dismissal of congrats modal view --> show original timer view
    
    @StateObject var focusSessionNavigationViewModel = FocusSessionNavigationViewModel()
    @StateObject var focusSessionViewModel: FocusSessionViewModel = FocusSessionViewModel()
    @EnvironmentObject var focusSessionManager: FocusSessionManager
    @State var displayFocusSessionDetailSheet = false
    @State var displayCongratulationsSheet = false
    
    @Environment(\.scenePhase) var scenePhase
    
    //present modal congratulations view when:
    //1. end session button pressed - when timer = 0
    //2. when timer = 0 naturally 
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Text("\(Date())")
                    .foregroundStyle(Color.white)
                DailyProgressBar()
                Spacer()
            }
            
            VStack {
                if focusSessionManager.countdownTimer != nil {
                    Button(action: {
                        displayFocusSessionDetailSheet = true
                    }, label: {
                        ProgressRing(progress: $focusSessionManager.displayPercent,
                                     remainingTime: $focusSessionManager.remainingTime,
                                     totalTime: $focusSessionManager.totalTime)
                    })
                    ColouredButton(title: "End Focus Session", colour: Color.red.opacity(0.9)) {
                        //  - clear out managed settings store - invalidate timer
                        focusSessionViewModel.center.stopMonitoring()
                        focusSessionManager.removeRestrictions()
                        focusSessionManager.stopFocusSession()
                    }
                }
                
                else if focusSessionManager.countdownTimer == nil {
                    LargeStartButton {
                        focusSessionNavigationViewModel.navigateToFocusMode = true
                    }
                    .padding(.bottom, 100)
                }
            }
            Spacer()
            
            if displayFocusSessionDetailSheet == true {
                FocusSessionDetailView(focusSessionViewModel: focusSessionViewModel)
                
                    .onTapGesture {
                        displayFocusSessionDetailSheet = false
                    }
            }
            
        }
        .background(
            Image("DarkBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        .fullScreenCover(isPresented: $focusSessionNavigationViewModel.navigateToFocusMode, content: {
            FocusTimeSetView(focusSessionViewModel: focusSessionViewModel, focusSessionNavigationViewModel: focusSessionNavigationViewModel)
        })
        
        .sheet(isPresented: $displayCongratulationsSheet, onDismiss: {
            displayCongratulationsSheet = false
            
           // focusSessionManager.countdownTimer = nil
            
        }) {
            CongratulationsView()
                .environmentObject(focusSessionManager)
        }
        .onChange(of: focusSessionManager.isTimerFinished, { _, isFinished in
            if isFinished {
                displayCongratulationsSheet = true
                focusSessionManager.isTimerFinished = false
            }
        })
        
        .onChange(of: scenePhase, {
            
            switch scenePhase {
                
            case .active:
                focusSessionManager.calculateTimeDifference()
                print("active")
                
            case .background:
                print("background")
                focusSessionManager.pauseSessionTimer()
                print("bg: Pause at \(focusSessionManager.timeOnLeave?.timeIntervalSince1970 ?? 77.77)")
            case .inactive:
                print("inactive")
                
            default: print("ScenePhase: unexpected state")
            }
        })
    }
}

#Preview {
    ContentView()
        .environmentObject(FocusSessionManager())
}

//congratulations view does not show twice


//VStack {
//    ForEach(focusSessionViewModel.intentions) { intention in
//        List {
//            Text(intention.title)
//        }
//    }
//}
