//
//  Day05App.swift
//  Day05
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

@main
struct Day05App: App {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
