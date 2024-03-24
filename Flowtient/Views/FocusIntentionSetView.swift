//
//  FocusIntentionSetView.swift
//  Flowtient
//
//  Created by shafique dassu on 15/03/2024.
//

import SwiftUI
import FamilyControls

struct FocusIntentionSetView: View {
    @State var goalOne: String = ""
    @State var goalTwo: String = ""
    @State var textFieldArray: [IntentionTextFieldRow] = [IntentionTextFieldRow()]
    @State var navigateToAppPermissionsView = false
    
    
    
    func addTextField() {
        textFieldArray.append(IntentionTextFieldRow())
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("I N T E N T I O N")
            Text("What do you want to accomplish? \n Select your goals")
          
            VStack {
                
                ForEach(Array(textFieldArray.prefix(3).enumerated()), id: \.1) { index, row in
                    HStack {
                        Text("\(index + 1)")
                        row
                    }
                    .padding(.horizontal)
                }
                if textFieldArray.count >= 3 {
                    PrimaryButton(title: "Add Another Goal") {
                        //show warning message
                    }
                } else {
                    PrimaryButton(title: "Add Another Goal") {
                        addTextField()
                    }
                }
                
                
            }
            
            
            Text("Tag your Focus Session")
                .padding(.top, 40)
            VStack {
                HStack(spacing: 50) {
                    IntentionIconCircleButton(imageName: "briefcase", title: "Work")
                    IntentionIconCircleButton(imageName: "person", title: "rest")
                    IntentionIconCircleButton(imageName: "lock.display", title: "play")
                }
                PrimaryButton(title: "Create a new tag") {
                    //load new view for new tags
                }
                .padding(.top, 20)
            }
            .padding(.top, 30)
            Spacer()
            PrimaryButton(title: "Next") {
                navigateToAppPermissionsView = true
            }
        }
        .navigationDestination(isPresented: $navigateToAppPermissionsView) {
            //nav to view
            FocusAppSelectionView()
        }
    }
}

#Preview {
    FocusIntentionSetView()
}





