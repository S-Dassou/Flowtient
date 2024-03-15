//
//  ContentView.swift
//  Flowtient
//
//  Created by shafique dassu on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "timer")
                .font(.system(size: 30))
            
            HStack {
                Text("Total Pickups: 5")
                Text("||")
                Text("Total Screentime: 5h30m")
            }
            
            PrimaryButton(title: "Start Focus Mode") {
                
            }
        }
    }
}

#Preview {
        ContentView()
}
