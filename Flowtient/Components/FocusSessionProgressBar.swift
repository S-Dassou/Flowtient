//
//  FocusSessionProgressBar.swift
//  Flowtient
//
//  Created by shafique dassu on 07/06/2024.
//

import SwiftUI

struct FocusSessionProgressBar: View {
    
    @Binding var percent: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            ZStack(alignment: .trailing) {
                Capsule()
                    .fill(Color.black.opacity(0.08))
                    .frame(height: 22)
                Text(String(format: "%.0f", self.percent * 100) + "%")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .padding(.trailing)
            }
            
            Capsule()
                .fill(LinearGradient(gradient: .init(colors: [Color("ProgressBlue"), Color("ProgressGreen")]), startPoint: .leading, endPoint: .trailing))
                .frame(width: self.calcPercent(), height: 20)
        }
        .padding(18)
        .background(Color.black.opacity(0.1))
        .cornerRadius(18)
    }
    
    func calcPercent() -> CGFloat {
        let width = UIScreen.main.bounds.width - 38
        
        return width * self.percent
    }
}

#Preview {
    FocusSessionProgressBar(percent: .constant(1))
}
