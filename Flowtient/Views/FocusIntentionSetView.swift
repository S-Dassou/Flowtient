//
//  FocusIntentionSetView.swift
//  Flowtient
//
//  Created by shafique dassu on 15/03/2024.
//

import SwiftUI
import FamilyControls

struct FocusIntentionSetView: View {
    
    @StateObject var viewModel = FocusIntentionSetViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("I N T E N T I O N")
            Text("What do you want to accomplish? \n Write your goals")
          
            VStack {
                ForEach(Array(viewModel.textFieldArray.prefix(2).enumerated()), id: \.1) { index, row in
                    HStack {
                        Text("\(index + 1)")
                        row
                    }
                    .padding(.horizontal)
                }
                if viewModel.textFieldArray.count >= 2 {
                    PrimaryButton(title: "Add Another Goal") {
                        //show warning message
                    }
                } else {
                    PrimaryButton(title: "Add Another Goal") {
                        viewModel.addTextField()
                    }
                }
            }
            HStack {
                Button {
                    //edit all tags
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.system(size: 30))
                        .foregroundStyle(Color.gray)
                }
                VStack {
                    Text("Tag your Focus Session")
                    Text("Choose up to 3")
                }
                Button {
                    //go to create new tag view
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 30))
                        .foregroundStyle(Color.gray)
                }

            }
                .padding(.top, 40)
            VStack {
                HStack(spacing: 50) {
                    ForEach(viewModel.intentionTags) { tag in
                        IntentionIconCircleButton(intentionTag: tag)
                    }
                }
   
               
            }
            .padding(.top, 30)
            Spacer()
            PrimaryButton(title: "Next") {
                viewModel.navigateToAppPermissionsView = true
            }
        }
        .navigationDestination(isPresented: $viewModel.navigateToAppPermissionsView) {
            //nav to view
            FocusAppSelectionView()
        }
    }
}

#Preview {
    FocusIntentionSetView()
}





