//
//  CongratulationsProgressRing.swift
//  Flowtient
//
//  Created by shafique dassu on 23/06/2024.
//

import SwiftUI

struct CongratulationsProgressRing: View {
    
    @Binding var percentComplete: CGFloat
    
    var timeCompleted: String
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            Circle()
                .trim(from: 0.0, to: min(percentComplete, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.green]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.easeInOut(duration: 1.0), value: percentComplete)
            
            VStack(spacing: 30) {
                //MARK: Elapsed Time
                VStack(spacing: 5) {
                    Text("Time in Flow")
                        .opacity(0.7)
                        .foregroundStyle(Color.white)
                    Text(timeCompleted)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                }
                .padding(.top)
                
            }
        }
        .frame(width: 250, height: 250)
        .padding()
    }
}

#Preview {
    CongratulationsProgressRing(percentComplete: .constant(0.5), timeCompleted: "5")
}
