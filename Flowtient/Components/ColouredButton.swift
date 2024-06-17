//
//  RedButton.swift
//  Flowtient
//
//  Created by shafique dassu on 17/06/2024.
//

import SwiftUI

struct ColouredButton: View {
    let title: String
    var colour: Color
    var action: () -> Void
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(colour)
                    .cornerRadius(10)
                    .padding(.horizontal, 23)
            }
        }
    }
}

#Preview {
    ColouredButton(title: "End Session", colour: Color.red, action: { })
}
