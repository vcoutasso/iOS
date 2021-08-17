//
//  RecipeView.swift
//  Day04
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let author: String
    let portions: Int
    let rating: Int
    let difficulty: Int
    let preparationTime: Int
    let ingredients: [String]
    let preparationSteps: [String]
    let imageName: String
}

struct RecipeView: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
            ScrollView {
                Image(recipe.imageName)
                    .resizable()
                    .frame(width: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .aspectRatio(372 / 224, contentMode: .fill)
                    .clipped()
                
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        // Header
                        RecipeHeaderView(recipeAuthor: recipe.author, recipeName: recipe.name)
  
                        // Recipe Info
                        RecipeInfoView(portions: recipe.portions, difficulty: recipe.difficulty, rating: recipe.rating, preparationTime: recipe.preparationTime)
                        
                        // Recipe
                        RecipeSectionView(title: "Ingredientes", elements: recipe.ingredients, useBulletPoints: true)
                        RecipeSectionView(title: "Modo de preparo", elements: recipe.preparationSteps, useBulletPoints: false)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
}

struct RecipeView_Previews: PreviewProvider {
    
    static let mock: Recipe = .fixture()
    
    static var previews: some View {
        RecipeView(recipe: mock)
    }
}
