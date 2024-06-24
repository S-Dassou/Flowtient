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
    @StateObject private var focusSessionManager = FocusSessionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(focusSessionManager)
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
