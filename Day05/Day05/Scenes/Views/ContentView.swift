//
//  ContentView.swift
//  Day05
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("showOnboarding") var showOnboarding: Bool?
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        Group {
            if showOnboarding ?? true {
                OnboardingView(fruits: viewModel.fruits)
            }
            else {
                ListView(fruits: viewModel.fruits)
            }
        }
        .onAppear{ viewModel.fetchFruits() }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
#endif
