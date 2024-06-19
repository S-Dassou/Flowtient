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
    @EnvironmentObject var focusSessionManager: FocusSessionManager
    
    var body: some View {
        VStack {
            Text("Tap the shield to select apps you'd like to mute")
                .foregroundStyle(Color.white)
            
            Button(action: {
                isPresented = true
            }, label: {
                LottieView(filename: "LottieShield")
            })
            .familyActivityPicker(isPresented: $isPresented, selection: $viewModel.selectionToDiscourage)
            
//            Button("select apps") {
//                
//            }
//            .familyActivityPicker(isPresented: $isPresented, selection: $viewModel.selectionToDiscourage)
            
            GreyButton(title: "Start Session") {
                //start monitoring session
                //go to home page - dismiss all navigation stack
                //load up active session bar in home page and disable start session button
                focusSessionViewModel.startMonitoring()
                focusSessionNavigationViewModel.goBackToHomeView()
                focusSessionManager.startSessionTimer()
            }
        }
        .background(
            Image("DarkBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        .onChange(of: viewModel.selectionToDiscourage) {
            viewModel.saveSelection(selection: viewModel.selectionToDiscourage)
            print("\(viewModel.selectionToDiscourage)")
        }
    }
}

#Preview {
    FocusAppSelectionView(focusSessionViewModel: FocusSessionViewModel(focusSessionManager: FocusSessionManager()), focusSessionNavigationViewModel: FocusSessionNavigationViewModel())
        .environmentObject(FocusSessionManager())
}
