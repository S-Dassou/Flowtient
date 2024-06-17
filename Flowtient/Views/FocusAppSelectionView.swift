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
    @ObservedObject var focusSessionNavigationViewModel: FocusSessionNavigationViewModel
    @Environment(FocusSessionManager.self) var focusSessionManager
    
    var body: some View {
        VStack {
            Text("Choose which apps you'd like to block")
            Button("select apps") {
                isPresented = true
            }
            .familyActivityPicker(isPresented: $isPresented, selection: $viewModel.selectionToDiscourage)
            
            GreyButton(title: "Start Session") {
                //start monitoring session
                //go to home page - dismiss all navigation stack
                //load up active session bar in home page and disable start session button
                focusSessionViewModel.startMonitoring()
                focusSessionNavigationViewModel.goBackToHomeView()
                focusSessionManager.startSessionTimer()
            }
        }
        .onChange(of: viewModel.selectionToDiscourage) {
            viewModel.saveSelection(selection: viewModel.selectionToDiscourage)
            print("\(viewModel.selectionToDiscourage)")
        }
    }
}

#Preview {
    FocusAppSelectionView(focusSessionViewModel: FocusSessionViewModel(), focusSessionNavigationViewModel: FocusSessionNavigationViewModel())
        .environment(FocusSessionManager())
}
