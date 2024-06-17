//
//  ProgressRing.swift
//  Flowtient
//
//  Created by shafique dassu on 14/06/2024.
//

import SwiftUI

struct ProgressRing: View {
    
    @Binding var progress: CGFloat
    @Binding var remainingTime: Int
    @Binding var totalTime: Int
    
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
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.green]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                //MARK: Elapsed Time
                VStack(spacing: 5) {
                    Text("Elapsed Time")
                        .opacity(0.7)
                        .foregroundStyle(Color.black)
                    Text(displayTimeElapsed)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                }
                .padding(.top)
                    //MARK: Remaining Time
                    VStack(spacing: 5) {
                        Text("Remaining Time")
                            .opacity(0.7)
                        Text(displayRemainingTime)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                    }
                }
            }
        .frame(width: 250, height: 250)
        .padding()
    }
}

#Preview {
    ProgressRing(progress: .constant(0.5), remainingTime: .constant(50), totalTime: .constant(120))
}
