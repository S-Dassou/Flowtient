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

struct AppPermissionsView: View {
    @State var isPresented = false
    @State var selection = FamilyActivitySelection()
    
    @StateObject var viewModel: FocusSessionViewModel
    
    
    
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
                viewModel.startMonitoring()
                
            }
        }
        .onChange(of: viewModel.selectionToDiscourage) {
            viewModel.setShieldRestrictions()
            viewModel.saveSelection(selection: viewModel.selectionToDiscourage)
            print("\(viewModel.selectionToDiscourage)")
        }
    }
}

#Preview {
    AppPermissionsView(viewModel: FocusSessionViewModel(selectionToDiscourage: FamilyActivitySelection()))
}
