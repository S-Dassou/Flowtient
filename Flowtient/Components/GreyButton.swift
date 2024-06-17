//
//  PrimaryButton.swift
//  Flowtient
//
//  Created by shafique dassu on 14/03/2024.
//

import SwiftUI

struct GreyButton: View {
    let title: String
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
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal, 23)
            }
        }
    }
}

struct GreyButton_Previews: PreviewProvider {
    static func action() {
        
    }
    static var previews: some View {
        GreyButton(title: "Log In", action: action)
    }
}
