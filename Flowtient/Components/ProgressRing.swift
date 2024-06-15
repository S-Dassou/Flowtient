//
//  ProgressRing.swift
//  Flowtient
//
//  Created by shafique dassu on 14/06/2024.
//

import SwiftUI

struct ProgressRing: View {
    
    @State var progress = 0.0
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.green, Color.yellow]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                //MARK: Elapsed Time
                VStack(spacing: 5) {
                    Text("Elapsed Time")
                        .opacity(0.7)
                    Text("0.00")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top)
                    //MARK: Remaining Time
                    VStack(spacing: 5) {
                        Text("Remaining Time")
                            .opacity(0.7)
                        Text("0.00")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                    }
                }
            }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear(perform: {
            progress = 1.0
        })
    }
}

#Preview {
    ProgressRing()
}
