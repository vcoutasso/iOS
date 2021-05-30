//
//  RecipeHeaderView.swift
//  Challenge3
//
//  Created by Vinícius Couto on 28/05/21.
//

import SwiftUI

struct RecipeHeaderView: View {
    
    let recipeAuthor: String
    let recipeName: String
    
    var body: some View {
        VStack {
            Text("""
                Receita de \
                \(Text(recipeAuthor)
                    .foregroundColor(Color("highlight-text"))
                    .font(.system(size: 16, weight: .regular, design: .default)))
                """)
                .foregroundColor(Color("secondary-text"))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(recipeName)
                .font(.system(size: 48, weight: .bold, design: .serif))
                .foregroundColor(Color("primary-text"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading)
    }
}

struct RecipeHeaderView_Previews: PreviewProvider {
    
    static let mock: Recipe = .fixture()
    
    static var previews: some View {
        RecipeHeaderView(recipeAuthor: mock.author, recipeName: mock.name)
    }
}
