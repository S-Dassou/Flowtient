//
//  FlowtientApp.swift
//  Flowtient
//
//  Created by shafique dassu on 14/03/2024.
//

import SwiftUI
import FamilyControls

@main
struct FlowtientApp: App {
    let center = AuthorizationCenter.shared
    @State var focusSessionManager = FocusSessionManager()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                ContentView()
                    .environment(focusSessionManager)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
            }
            .onAppear(perform: {
                Task {
                    do {
                        try await center.requestAuthorization(for: .individual)
                    } catch {
                        print("Failed authorization with error \(error)")
                    }
                }
            })
        }
    }
}
