//
//  IntentionIconCircle.swift
//  Flowtient
//
//  Created by shafique dassu on 15/03/2024.
//

import SwiftUI

struct IntentionIconCircleButton: View {
    let intentionTag: IntentionTag
    var circleDimension: CGFloat = (UIScreen.main.bounds.width - 150) / 3
    @State var isSelected = false
    
    var body: some View {
        
        Button(action: {
            isSelected.toggle()
        }, label: {
            VStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(isSelected ? Color.orange.opacity(0.8) : Color.gray.opacity(0.6))
                        .frame(width: circleDimension, height: circleDimension)
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(isSelected ? Color.orange : Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: circleDimension, height: circleDimension)
                    Image(systemName: intentionTag.icon)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: 90))
                }
                .rotationEffect(.init(degrees: -90))
                HStack {
                    Text(intentionTag.title)
                        .textCase(.uppercase)
                        .font(.system(size: 19))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        })
        
    }
}

#Preview {
    IntentionIconCircleButton(intentionTag: IntentionTag(id: "Default3", title: "Hi", icon: "person"))
}
