//
//  IntentionTextFieldRow.swift
//  Flowtient
//
//  Created by shafique dassu on 16/03/2024.
//

import SwiftUI

struct IntentionTextFieldRow: View, Identifiable {
    let id = UUID()
    @State var goal = ""
    
    var body: some View {
        TextField("Hi", text: $goal)
            .foregroundColor(.black)
            .frame(height: 50)
            .background(.clear)
            .padding(.horizontal)
            
    }
}

#Preview {
    IntentionTextFieldRow()
}

extension IntentionTextFieldRow: Hashable {
    static func == (lhs: IntentionTextFieldRow, rhs: IntentionTextFieldRow) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}
