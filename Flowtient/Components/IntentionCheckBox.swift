//
//  IntentionCheckBox.swift
//  Flowtient
//
//  Created by shafique dassu on 17/06/2024.
//

import SwiftUI

struct IntentionCheckBox: View {
    
    @Binding var isComplete: Bool
    let text: String
    
    fileprivate func checkmarkBox() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 30, height: 30)
            .foregroundColor(.gray.opacity(0.6))
    }
    
    var body: some View {
        ZStack {
            Button {
                isComplete.toggle()
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isComplete ? Color("ProgressGreen").opacity(0.9): Color.black.opacity(0.3))
                        .frame(height: 50)
                        .padding(.horizontal, 23)
                    HStack {
                        
                        Text(text)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        if isComplete {
                            ZStack {
                                checkmarkBox()
                                    .padding(.trailing)
                                Image(systemName: "flag.checkered")
                                    .font(.title2)
                                    .foregroundStyle(Color.black)
                                    .padding(.trailing)
                            } 
                            .padding(.trailing, 18)
                        } else {
                            ZStack {
                                checkmarkBox()
                                    .padding(.trailing)
                            }
                            .padding(.trailing, 18)
                        }
                    }
                    .padding(.leading, 40)
                }
            }
        }
    }
}

#Preview {
    IntentionCheckBox(isComplete: .constant(false), text: "Finish biology work until the sun come up")
}
