//
//  ChallengeApp.swift
//  Challenge
//
//  Created by Vinícius Couto on 30/05/21.
//

import SwiftUI

@main
struct ChallengeApp: App {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
