//
//  DailyProgressBar.swift
//  Flowtient
//
//  Created by shafique dassu on 17/06/2024.
//

import SwiftUI

struct DailyProgressBar: View {
    @State private var currentTime = Date()
    @State private var progress: Double = 0.0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    // Background rectangle with rounded corners
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 30)
                    
                    // Progress rectangle with rounded corners
                    RoundedRectangle(cornerRadius: 6)
                        .fill(AngularGradient(gradient: Gradient(colors: [Color.black, Color("ProgressGreen")]), center: .bottom))
                    
                        .frame(width: width * CGFloat(progress), height: 30)
                    
                    // Notches representing each hour
                    ForEach(1..<24) { hour in
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .shadow(color: .black, radius: 10, x: 5, y: 10)
                            .frame(width: 3, height: 30)
                            .offset(x: width * CGFloat(hour) / 24)
                    }
                }
            }
            .frame(height: 30)
            .padding(.top)
            .padding(.horizontal)
            
            Text("\(Int(progress * 100))% of the day completed")
                
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .shadow(radius: 10)
                .padding()
        }
        .onReceive(timer) { _ in
            updateProgress()
        }
    }
    
    private func updateProgress() {
        let calendar = Calendar.current
        // Start of the day: 00:00:01
        let startOfDay = calendar.startOfDay(for: currentTime).addingTimeInterval(1)
        // End of the day: 23:59:59
        let endOfDay = startOfDay.addingTimeInterval(24 * 60 * 60 - 2)
        // Time elapsed since the start of the day
        let timeElapsed = currentTime.timeIntervalSince(startOfDay)
        
        let totalDayTime = endOfDay.timeIntervalSince(startOfDay)
        progress = timeElapsed / totalDayTime
        currentTime = Date()
    }
}


#Preview {
    DailyProgressBar()
}
