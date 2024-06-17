//
//  LargeStartButton.swift
//  Flowtient
//
//  Created by shafique dassu on 17/06/2024.
//

import SwiftUI

struct LargeStartButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Color.clear.ignoresSafeArea()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("ProgressGreen"))
                            .opacity(0.5)
                            .frame(height: 170)
                        
                        HStack(alignment: .center) {
                            Image("LightBulbJigsaw")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .padding(.leading, 10)
                                .padding(.top, 70)

                                Text("ENTER \nFOCUS \nMODE")
                                    .fontWeight(.bold)
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                    .padding(.trailing)

                        }
                        
                        
                    }
                }
            }
            .padding(.horizontal, 17)
            .frame(height: 168)
        }
    }
}

#Preview {
    LargeStartButton(action: { })
}
