//
//  ListView.swift
//  Challenge
//
//  Created by Vinícius Couto on 30/05/21.
//

import SwiftUI

struct ListView: View {
    
    let fruits: [Fruit]
    
    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                NavigationLink(destination: FruitInfoView(fruit: fruit)) {
                    rowItem(fruit: fruit)
                }
            }
            .navigationTitle("Fruits")
        }
        .accentColor(.white)
    }
    
    private func rowItem(fruit: Fruit) -> some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(fruit.bgGradientLower)
                    .frame(width: 80, height: 80, alignment: .leading)
                    .cornerRadius(8)
                    .overlay(
                        Image(fruit.imageName)
                            .resizable()
                            .scaledToFit()
                            .padding(5)
                    )
            }
            
            VStack(alignment: .leading) {
                Text(fruit.name)
                    .font(.system(.title2, design: .default)
                            .weight(.bold))
                
                Text(fruit.shortDescription)
                    .font(.system(.caption, design: .default)
                            .weight(.regular))
                    .foregroundColor(Color("gray"))
            }
            .frame(minHeight: 0, maxHeight: 80, alignment: .top)
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    
    static let mockFruits: [Fruit] = [.fixture(), .fixture()]
    
    static var previews: some View {
        ListView(fruits: mockFruits)
    }
}
#endif
