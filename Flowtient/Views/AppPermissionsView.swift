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
    
    @StateObject var viewModel: AppPermissionsViewModel
    
    
    
    var body: some View {
        Text("Choose which apps you'd like to block")
        Button("select apps") {
            isPresented = true
            
            print("--------\(viewModel.selectionToDiscourage)")
        }
        .familyActivityPicker(isPresented: $isPresented, selection: $viewModel.selectionToDiscourage)
//        .onChange(of: $viewModel.selectionToDiscourage) { _ in
//            viewModel.setShieldRestrictions()
//        }
        
        
    }
}

#Preview {
    AppPermissionsView(viewModel: AppPermissionsViewModel(selectionToDiscourage: FamilyActivitySelection()))
}
