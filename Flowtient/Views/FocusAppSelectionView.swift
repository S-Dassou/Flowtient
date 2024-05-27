//
//  AppPermissionsView.swift
//  Flowtient
//
//  Created by shafique dassu on 16/03/2024.
//

import SwiftUI
import FamilyControls
import DeviceActivity
import ManagedSettings

struct FocusAppSelectionView: View {
    @State var isPresented = false
    @StateObject var viewModel = FocusAppSelectionViewModel()
    @ObservedObject var focusSessionViewModel: FocusSessionViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Choose which apps you'd like to block")
            Button("select apps") {
                isPresented = true
            }
            .familyActivityPicker(isPresented: $isPresented, selection: $viewModel.selectionToDiscourage)
            
            PrimaryButton(title: "Start Session") {
                //start monitoring session
                //go to home page
                //load up active session bar in home page and disable start session button
            
                focusSessionViewModel.startMonitoring()
                dismiss()
            }
        }
        .onChange(of: viewModel.selectionToDiscourage) {
            viewModel.saveSelection(selection: viewModel.selectionToDiscourage)
           // viewModel.setShieldRestrictions()
            
            print("\(viewModel.selectionToDiscourage)")
        }
    }
}

#Preview {
    FocusAppSelectionView(focusSessionViewModel: FocusSessionViewModel())
}
