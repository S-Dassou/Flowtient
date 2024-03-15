//
//  FlowtientApp.swift
//  Flowtient
//
//  Created by shafique dassu on 14/03/2024.
//

import SwiftUI

@main
struct FlowtientApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                
            }
            
        }
    }
}
