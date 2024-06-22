//
//  CongratulationsView.swift
//  Flowtient
//
//  Created by shafique dassu on 20/06/2024.
//

import SwiftUI

struct CongratulationsView: View {
    
    @EnvironmentObject var focusSessionManager: FocusSessionManager
    
    var body: some View {
        ZStack {
            BgdFullScreenVideoView(videoName: "CongratulationsVideo")
            VStack {
                //congratulations text
                Text("CONGRATULATIONS")
                    .foregroundStyle(.white)
                    .font(.system(size: 35, weight: .bold))
                    .padding()
                
                //progress ring
                ProgressRing(progress: .constant(1), remainingTime: $focusSessionManager.remainingTime, totalTime: $focusSessionManager.totalTime)
                    
                
                Spacer()
                
            
            }
        }
    }
}

#Preview {
    CongratulationsView()
        .environmentObject(FocusSessionManager())
}
