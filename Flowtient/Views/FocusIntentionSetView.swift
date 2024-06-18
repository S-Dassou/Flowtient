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
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.top, 40)
            
            Text("What do you want to accomplish in the next \(focusSessionViewModel.sliderValue) minutes?")
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                
          
            VStack {
                ForEach(viewModel.textFieldArray.prefix(3)) { model in
                                if let index = viewModel.textFieldArray.firstIndex(where: { $0.id == model.id }) {
                                    HStack {
                                        Text("\(index + 1)")
                                            .foregroundStyle(Color.white)
                                            .fontWeight(.bold)
                                            .padding(.horizontal)
                                        IntentionTextFieldRow(goal: $viewModel.textFieldArray[index].goal) {
                                            viewModel.deleteItem(at: index)
                                        }
                                        .padding(.vertical)
                                    }
                                    .padding(.horizontal)
                              
                                }
                            }
                if viewModel.textFieldArray.count >= 3 {
                    GreyButton(title: "Add Another Goal") {
                        //show warning message
                    }
                    .padding(.top)
                } else {
                    GreyButton(title: "Add Another Goal") {
                        viewModel.addTextField()
                    }
                    .padding(.top)
                }
            }

Spacer()
            
            GreyButton(title: "Next") {
                focusSessionViewModel.intentions.removeAll()
                for intentionTextField in viewModel.textFieldArray {
                    focusSessionViewModel.intentions.append(IntentionModel(goal: intentionTextField.goal))
                }
                focusSessionNavigationViewModel.navigateToAppPermissionsView = true
            }
        }
        .background(
            Image("DarkBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        .navigationDestination(isPresented: $focusSessionNavigationViewModel.navigateToAppPermissionsView) {
            FocusAppSelectionView(focusSessionViewModel: focusSessionViewModel, focusSessionNavigationViewModel: focusSessionNavigationViewModel)
        }
    }
}

#Preview {
    FocusIntentionSetView(focusSessionViewModel: FocusSessionViewModel(), focusSessionNavigationViewModel: FocusSessionNavigationViewModel())
}





