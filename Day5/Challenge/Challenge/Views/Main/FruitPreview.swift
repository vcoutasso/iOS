//
//  FruitPreview.swift
//  Challenge
//
//  Created by Vinícius Couto on 30/05/21.
//

import SwiftUI

struct FruitPreview: View {
    
    let fruit: Fruit
    
    var body: some View {
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
                    )
            }
            
            VStack(alignment: .leading) {
                Text(fruit.name)
                    .font(.system(size: 20, weight: .bold, design: .default))
                
                Text(fruit.shortDescription)
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .foregroundColor(Color("gray"))
            }
            .frame(minHeight: 0, maxHeight: 80, alignment: .top)
        }
    }
}

struct FruitPreview_Previews: PreviewProvider {
    
    static let mockFruit: Fruit = .fixture()
    
    static var previews: some View {
        FruitPreview(fruit: mockFruit)
    }
}
