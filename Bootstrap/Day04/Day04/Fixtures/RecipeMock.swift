//
//  RecipeMock.swift
//  Day04
//
//  Created by Vinícius Couto on 02/06/21.
//

import Foundation

#if DEBUG
extension Recipe {
    static func fixture(
        name: String = "Lipsum",
        author: String = "Author",
        portions: Int = 3,
        rating: Int = 4,
        difficulty: Int = 1,
        preparationTime: Int = 10,
        ingredients: [String] = [
            "Lorem ipsum dolor sit amet",
            "consectetur adipiscing elit",
            "In elementum massa vitae diam auctor",
            "sit amet euismod purus sodales"
        ],
        preparationSteps: [String] = [
            "Mauris ullamcorper est turpis, nec tincidunt eros vestibulum eu.",
            "Proin et efficitur nisl, eu tempus orci.",
            "Maecenas ut ex risus. Etiam sed viverra magna.",
        ],
        imageName: String = ""
    ) -> Recipe {
        .init(name: name, author: author, portions: portions, rating: rating, difficulty: difficulty, preparationTime: preparationTime, ingredients: ingredients, preparationSteps: preparationSteps, imageName: imageName)
    }
}
#endif
