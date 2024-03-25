//
//  FocusTimeSetViewModel.swift
//  Flowtient
//
//  Created by shafique dassu on 24/03/2024.
//

import Foundation

class FocusTimeSetViewModel: ObservableObject {
    @Published var timeSelected: CGFloat = 0.0
    @Published var navigateToIntentView = false
    @Published var sliderValue: Int = 0
}
