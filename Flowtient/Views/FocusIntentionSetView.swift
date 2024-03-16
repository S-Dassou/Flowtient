//
//  FocusIntentionSetView.swift
//  Flowtient
//
//  Created by shafique dassu on 15/03/2024.
//

import SwiftUI

struct FocusIntentionSetView: View {
    @State var goalOne: String = ""
    @State var goalTwo: String = ""
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("I N T E N T I O N")
            Text("What do you want to accomplish? \n Select your goals")
          
            VStack {
                HStack {
                    Text("1.")
                    TextField("Hi", text: $goalOne)
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .background(.clear)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                HStack {
                    Text("2.")
                    TextField("Hi 2", text: $goalOne)
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .background(.clear)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                
                PrimaryButton(title: "Add Another Goal") {
                    
                }
            }
            
            
            Text("Tag your Focus Session")
                .padding(.top, 40)
            VStack {
                HStack(spacing: 50) {
                    IntentionIconCircleButton(imageName: "briefcase", title: "Work")
                    IntentionIconCircleButton(imageName: "person", title: "iOS")
                    IntentionIconCircleButton(imageName: "lock.display", title: "Computer")
                }
            }
            .padding(.top, 30)
            Spacer()
        }
    }
}

#Preview {
    FocusIntentionSetView()
}

func addTextField() {
    
}



