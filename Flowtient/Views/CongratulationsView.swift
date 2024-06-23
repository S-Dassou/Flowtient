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
                CongratulationsProgressRing(percentComplete: .constant(0.5), timeCompleted: focusSessionManager.displayTimeElapsed)
                    
                
                Spacer()
            }
        }
    }
}

#Preview {
    CongratulationsView()
        .environmentObject(FocusSessionManager())
}
