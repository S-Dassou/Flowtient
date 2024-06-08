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
    
    var body: some View {
        @Bindable var focusSessionManager = focusSessionManager
        VStack {
            Image(systemName: "timer")
                .font(.system(size: 30))
            
            HStack {
                Text("Total Pickups: 5")
                Text("||")
                Text("Total Screentime: 5h30m")
            }
            
            PrimaryButton(title: "Start Focus Mode") {
                focusSessionNavigationViewModel.navigateToFocusMode = true
            }
            
            //timer
            if focusSessionManager.countdownTimer != nil {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 3)
    
                    VStack {
                        FocusSessionProgressBar(percent: $focusSessionManager.displayPercent)
                        Text(focusSessionManager.displayTime)
                            .foregroundStyle(Color.black)
                    }
                }
            }
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
