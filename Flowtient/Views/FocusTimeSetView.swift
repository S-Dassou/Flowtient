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
    
    @State var timeSelected: CGFloat = 0.0
    @State var navigateToIntentView = false
    
    var body: some View {
        VStack {
            Text("T I M E")
                .padding(.top, 40)
            Text("Your Most Precious Commodity")
            Text("Select How Long You Want To Focus For")
                .padding(.top, 20)
            Spacer()
            CircularSlider()
            Spacer()
            PrimaryButton(title: "Next") {
                navigateToIntentView = true
            }
        }
        .navigationDestination(isPresented: $navigateToIntentView) {
            FocusIntentionSetView()
        }
    }
}

#Preview {
    FocusTimeSetView()
}

struct CircularSlider: View {
    
    @State private var sliderValue: Double = 0
    private let sliderRange = 0.0...240.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 20)
            Circle()
                .trim(from: 0, to: CGFloat(sliderValue / 240))
                .stroke(Color.blue, lineWidth: 20)
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(Color.yellow)
                .frame(width: 30, height: 30)
                .offset(y: -150)
                .rotationEffect(.degrees(sliderValue * 1.5))
            
            Text("\(Int(sliderValue))")
                .font(.largeTitle)
                .fontWeight(.bold)
                
        }
        .frame(width: 300, height: 300)
        .gesture(
        DragGesture(minimumDistance: 0)
            .onChanged({ value in
                let vector = CGVector(dx: value.location.x - 150, dy: value.location.y - 150)
                let angle = atan2(vector.dy, vector.dx) + .pi / 2
                let value = angle >= 0 ? angle : angle + 2 * .pi
                sliderValue = max(sliderRange.lowerBound, min(sliderRange.upperBound, Double(value) * 240 / (2 * .pi)))
            })
        )
    }
    
    
}
