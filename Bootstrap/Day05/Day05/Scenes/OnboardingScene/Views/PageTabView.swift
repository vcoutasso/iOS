//
//  PageTabView.swift
//  Day05
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct PageTabView: View {
    let fruit: Fruit
    let showButton: Bool
    
    var body: some View {
        VStack {
            Image(fruit.imageName)
            
            Group {
                Text(fruit.name)
                    .font(.system(.title, design: .default)
                            .weight(.bold))
                    .padding(.bottom)
                
                Text(fruit.shortDescription)
                    .font(.system(.body, design: .default)
                            .weight(.regular))
                    .frame(maxWidth: 0.8 * UIScreen.main.bounds.width)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            
            if showButton {
                ButtonView()
            }
        }
        .offset(y: -0.1 * UIScreen.main.bounds.width)
    }
}

#if DEBUG
struct PageTabView_Controller: PreviewProvider {
    
    static let mockFruit: Fruit = .fixture()
    
    static var previews: some View {
        PageTabView(fruit: mockFruit, showButton: true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [mockFruit.bgGradientLower, mockFruit.bgGradientUpper]), startPoint: .bottom, endPoint: .top)
            )
    }
}
#endif
