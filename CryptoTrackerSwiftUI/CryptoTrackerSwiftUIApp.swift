//
//  CryptoTrackerSwiftUIApp.swift
//  CryptoTrackerSwiftUI
//
//  Created by Juan Reyes on 8/24/21.
//

import SwiftUI

@main
struct CryptoTrackerSwiftUIApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
