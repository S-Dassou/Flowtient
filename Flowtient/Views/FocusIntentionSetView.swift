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
    @ObservedObject var focusSessionViewModel: FocusSessionViewModel
    @ObservedObject var focusSessionNavigationViewModel: FocusSessionNavigationViewModel
    
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
                        IntentionIconCircleButton(intentionTag: tag, onSelectionChanged: { isSelected in
                            if isSelected {
                                viewModel.addTag(tag)
                            } else {
                                viewModel.removeTag(tag)
                            }
                        })
                    }
                }
   
               
            }
            .padding(.top, 30)
            Spacer()
            PrimaryButton(title: "Next") {
                focusSessionNavigationViewModel.navigateToAppPermissionsView = true
            }
        }
        .navigationDestination(isPresented: $focusSessionNavigationViewModel.navigateToAppPermissionsView) {
            FocusAppSelectionView(focusSessionViewModel: focusSessionViewModel, focusSessionNavigationViewModel: focusSessionNavigationViewModel)
        }
    }
}

#Preview {
    FocusIntentionSetView(focusSessionViewModel: FocusSessionViewModel(), focusSessionNavigationViewModel: FocusSessionNavigationViewModel())
}





