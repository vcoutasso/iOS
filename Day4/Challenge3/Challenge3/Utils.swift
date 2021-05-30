//
//  Utils.swift
//  Challenge3
//
//  Created by Vinícius Couto on 28/05/21.
//

import Foundation
import SwiftUI

func getDifficultyText(difficulty: Int) -> Text {
    Text(difficulty <= 1 ? "iniciantes" :
        difficulty == 2 ? "experientes" :
        "masterchefs")
        .foregroundColor(Color("highlight-text"))
}

func getRatingSymbols(rating: Int, ratingIndicatorSymbolName: String = "star.circle.fill", maxStars: Int = 5) -> AnyView {
    AnyView(HStack(spacing: 0) {
        ForEach(1...maxStars, id: \.self) { i in
            Image(systemName: ratingIndicatorSymbolName).foregroundColor(Color(i <= rating ? "highlight-text" : "secondary-text"))
        }
    })
}

func filteredRecipes(recipes: [Recipe], searchText: String) -> [Recipe] {
    recipes.filter{ searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) || $0.author.lowercased().contains(searchText.lowercased()) }
}
