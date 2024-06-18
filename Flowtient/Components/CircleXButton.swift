//
//  CircleXButton.swift
//  Flowtient
//
//  Created by shafique dassu on 18/06/2024.
//

import SwiftUI

struct CircleXButton: View {
    var exitAction: () -> Void
    var body: some View {
        Image(systemName: "x.circle")
            .foregroundStyle(.white)
    }
}

#Preview {
    CircleXButton(exitAction: { })
}
