//
//  FocusSessionDetailView.swift
//  Flowtient
//
//  Created by shafique dassu on 17/06/2024.
//

import SwiftUI

struct FocusSessionDetailView: View {
    
    @ObservedObject var focusSessionViewModel: FocusSessionViewModel
    @StateObject var viewModel = FocusSessionDetailViewModel()
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                VStack(alignment: .leading) {
                    Spacer()
                    ScrollView {
                        ForEach($focusSessionViewModel.intentions) { $intention in
                            IntentionCheckBox(isComplete: $intention.isComplete, text: intention.goal)
                                
                        }
                        
                    }
                    .frame(height: geometry.size.height * 0.25)
                }
            }
        })
    }
}

#Preview {
    FocusSessionDetailView(focusSessionViewModel: FocusSessionViewModel())
}
