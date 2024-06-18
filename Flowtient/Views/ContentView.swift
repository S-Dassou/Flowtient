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
    
    @StateObject var focusSessionNavigationViewModel = FocusSessionNavigationViewModel()
    @StateObject var focusSessionViewModel = FocusSessionViewModel()
    @Environment(FocusSessionManager.self) var focusSessionManager
    @State var displayFocusSessionDetailSheet = false
    

    var body: some View {
        @Bindable var focusSessionManager = focusSessionManager
        ZStack {
            
            VStack {
                Text("\(Date())")
                    .foregroundStyle(Color.white)
                DailyProgressBar()
                Spacer()
            }
            
            VStack {
                if focusSessionManager.countdownTimer == nil {
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
        
    }
}

#Preview {
        ContentView()
        .environment(FocusSessionManager())
}

//VStack {
//    ForEach(focusSessionViewModel.intentions) { intention in
//        List {
//            Text(intention.title)
//        }
//    }
//}