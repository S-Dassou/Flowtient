//
//  FocusSessionNavigationViewModel.swift
//  Flowtient
//
//  Created by shafique dassu on 07/06/2024.
//

import Foundation
import SwiftUI

class FocusSessionNavigationViewModel: ObservableObject {
    @Published var navigateToFocusMode = false
    @Published var navigateToIntentView = false
    @Published var navigateToAppPermissionsView = false
    
    func goBackToHomeView() {
        navigateToFocusMode = false
        navigateToIntentView = false
        navigateToAppPermissionsView = false
    }
}
