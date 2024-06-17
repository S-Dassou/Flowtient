//
//  FocusSessionDetailView.swift
//  Flowtient
//
//  Created by shafique dassu on 17/06/2024.
//

import SwiftUI

struct FocusSessionDetailView: View {
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                Color.black.opacity(0.7).ignoresSafeArea()
                VStack {
                    Spacer()
                    ScrollView {
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")
                        Text("hi")

                    }
                    .frame(height: geometry.size.height * 0.25)
                }
            }
        })
    }
}

#Preview {
    FocusSessionDetailView()
}
