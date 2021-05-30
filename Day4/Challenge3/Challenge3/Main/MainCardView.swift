//
//  CardView.swift
//  Challenge3
//
//  Created by Vinícius Couto on 28/05/21.
//

import SwiftUI

struct MainCardView: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(318 / 140, contentMode: .fit)
                .frame(width: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .clipped()

            Text(recipe.name)
                .font(.system(size: 20, weight: .regular, design: .serif))
                .foregroundColor(Color("primary-text"))
            
            HStack {
                getRatingSymbols(rating: recipe.rating)
                    .font(.system(size: 18, weight: .regular, design: .serif))
                Text("até \(recipe.portions) porções")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 14, weight: .regular, design: .serif))
                    .foregroundColor(Color("secondary-text"))
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    
    static let mock: Recipe = .fixture()
    
    static var previews: some View {
        MainCardView(recipe: mock)
    }
}
