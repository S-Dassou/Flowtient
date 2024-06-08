//
//  FocusTimeSetView.swift
//  Flowtient
//
//  Created by shafique dassu on 15/03/2024.
//

import SwiftUI

//text at the top saying "TIME - our most precious asset"
//ring timer with a maximum time of 4 hours
//time displayed in the middle
//text at the bottom displaying info
//button navigating to the next focus onboarding view

struct FocusTimeSetView: View {
    
    @StateObject var viewModel = FocusTimeSetViewModel()
    @ObservedObject var focusSessionViewModel: FocusSessionViewModel
    @ObservedObject var focusSessionNavigationViewModel: FocusSessionNavigationViewModel
    @Environment(FocusSessionManager.self) var focusSessionManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("T I M E")
                    .padding(.top, 40)
                Text("Your Most Precious Commodity")
                Text("Select How Long You Want To Focus For")
                    .padding(.top, 20)
                Spacer()
                CircularSlider(sliderValue: $focusSessionViewModel.sliderValue)
                Spacer()
                PrimaryButton(title: "Next") {
                    print("next button tapped")
                    focusSessionManager.remainingTime = focusSessionViewModel.sliderValue * 60
                    focusSessionManager.totalTime = focusSessionViewModel.sliderValue * 60
                    focusSessionNavigationViewModel.navigateToIntentView = true
                }
            }
            .navigationDestination(isPresented: $focusSessionNavigationViewModel.navigateToIntentView) {
                FocusIntentionSetView(focusSessionViewModel: focusSessionViewModel, focusSessionNavigationViewModel: focusSessionNavigationViewModel)
            }
        }
    }
}

#Preview {
    FocusTimeSetView(focusSessionViewModel: FocusSessionViewModel(), focusSessionNavigationViewModel: FocusSessionNavigationViewModel())
        .environment(FocusSessionManager())
}

struct CircularSlider: View {
    
    @Binding var sliderValue: Int
    private let sliderRange = 0.0...241.0
    
    var displayTime: String {
        let totalTimeInMinutes = sliderValue
        let hours = Int(totalTimeInMinutes) / 60
        let minutes = Int(totalTimeInMinutes) % 60
        let seconds = Int(totalTimeInMinutes) * 60
        
        return String(format: "%02ih %02im", hours, minutes)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 20)
            Circle()
                .trim(from: 0, to: CGFloat(Double(sliderValue) / 241))
                .stroke(Color.blue, lineWidth: 20)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 30, height: 30)
                .offset(y: -150)
                .rotationEffect(.degrees(Double(sliderValue) * 1.5))
            
            Text(displayTime)
                .font(.largeTitle)
                .fontWeight(.bold)
            
        }
        .frame(width: 300, height: 300)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    let vector = CGVector(dx: value.location.x - 150, dy: value.location.y - 150)
                    let angle = atan2(vector.dy, vector.dx) + .pi / 2
                    let angleValue = angle >= 0 ? angle : angle + 2 * .pi
                    let newValue = Int(max(sliderRange.lowerBound, min(sliderRange.upperBound, Double(angleValue) * 241 / (2 * .pi))))
                    if sliderValue != newValue {
                        sliderValue = newValue
                        print("Slider value updated to \(sliderValue)")
                    }
                })
        )
    }
}
