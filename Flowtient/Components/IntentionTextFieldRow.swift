//
//  IntentionTextFieldRow.swift
//  Flowtient
//
//  Created by shafique dassu on 16/03/2024.
//

import SwiftUI

struct IntentionTextFieldRow: View, Identifiable {
    let id = UUID()
    @Binding var goal: String
    let deleteAction: () -> Void
    
    var body: some View {
        HStack {
            TextField("Add an intention", text: $goal)
                .foregroundColor(.white)
                .frame(height: 50)
                .background(.clear)
                .padding(.horizontal)
            
            Button(action: deleteAction) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .padding(.trailing)
        }
    }
}

#Preview {
    IntentionTextFieldRow(goal: .constant("Set up website"), deleteAction: {})
}

extension IntentionTextFieldRow: Hashable {
    static func == (lhs: IntentionTextFieldRow, rhs: IntentionTextFieldRow) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}
