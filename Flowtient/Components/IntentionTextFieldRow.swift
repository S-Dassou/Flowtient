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
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
            
            
            
            Button(action: deleteAction) {
                Image(systemName: "trash")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.red)
            }
            .padding(.horizontal)
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
