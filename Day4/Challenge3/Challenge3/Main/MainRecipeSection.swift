//
//  MainRecipeSection.swift
//  Challenge3
//
//  Created by Vinícius Couto on 30/05/21.
//

import SwiftUI

struct MainRecipeSection: View {
    
    let sectionName: String
    let recipes: [Recipe]
    let filter: String
    
    var body: some View {
        // Section
        VStack {
            HStack {
                Text(sectionName)
                    .font(.system(size: 26, weight: .bold, design: .serif))
                    .foregroundColor(Color("primary-text"))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                NavigationLink(destination: EmptyView()) {
                    Image("filter")
                        .resizable()
                        .frame(width: 36, height: 36, alignment: .trailing)
                        .clipped()
                }
            }
            
            // Recipes
            ForEach(filteredRecipes(recipes: recipes, searchText: filter)) { recipe in
                NavigationLink(destination: RecipeView(recipe: recipe)) {
                    MainCardView(recipe: recipe)
                }
                .padding()
            }
        }
    }
}

struct MainRecipeSection_Previews: PreviewProvider {
    
    static let mock: Recipe = .fixture()
    
    static var previews: some View {
        MainRecipeSection(sectionName: "Section", recipes: [mock], filter: "")
    }
}
