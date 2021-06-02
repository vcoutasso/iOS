//
//  OnboardingView.swift
//  Challenge
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct OnboardingView: View {
    let fruits: [Fruit]
    @State var currentIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(fruits.indices, id: \.self) { i in
                        PageTabView(fruit: fruits[i], showButton: i == fruits.count - 1).tag(i)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            }
        }
        .background(
            backgroundColor(for: fruits.isEmpty ? Fruit.fixture() : fruits[currentIndex])
                .ignoresSafeArea()
        )
        .animation(.easeInOut(duration: 0.2))
    }
    
    private func backgroundColor(for fruit: Fruit) -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [fruit.bgGradientLower, fruit.bgGradientUpper]), startPoint: .bottom, endPoint: .top)
    }
}

#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    
    static let mockFruit: [Fruit] = [.fixture(), .fixture()]
    
    static var previews: some View {
        OnboardingView(fruits: mockFruit)
    }
}
#endif
