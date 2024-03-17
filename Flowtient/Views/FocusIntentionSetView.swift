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
    @State var textFieldArray: [IntentionTextFieldRow] = [IntentionTextFieldRow()]
    
    func addTextField() {
        textFieldArray.append(IntentionTextFieldRow())
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("I N T E N T I O N")
            Text("What do you want to accomplish? \n Select your goals")
          
            VStack {
                
                ForEach(Array(textFieldArray.enumerated()), id: \.1) { index, row in
                    HStack {
                        Text("\(index + 1)")
                        row
                    }
                    .padding(.horizontal)
                }
                
                PrimaryButton(title: "Add Another Goal") {
                    addTextField()
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





