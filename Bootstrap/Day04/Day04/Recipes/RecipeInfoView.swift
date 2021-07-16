//
//  RecipeInfoView.swift
//  Day04
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct RecipeInfoView: View {
    
    let portionsSymbolName: String = "cart"
    let difficultySymbolName: String = "bolt"
    let ratingSymbolName: String = "star"
    let timeSymbolName: String = "clock"
    let ratingIndicatorSymbolName: String = "star.circle.fill"
    
    let maxStars = 5
    
    let portions: Int
    let difficulty: Int
    let rating: Int
    let preparationTime: Int
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                Image(systemName: portionsSymbolName)
                Image(systemName: difficultySymbolName)
            }
            VStack(alignment: .leading) {
                Text("Até \(portions) porções")
                Text("Para \(getDifficultyText(difficulty: difficulty))")
            }
            Spacer()
            VStack(alignment: .center) {
                Image(systemName: ratingSymbolName)
                Image(systemName: timeSymbolName)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Avaliação")
                    getRatingSymbols(rating: rating)
                }
                Text("Prepare em \(preparationTime) minutos")
            }
            Spacer()
        }
        .font(.system(size: 13, weight: .regular, design: .default))
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .foregroundColor(Color("secondary-text"))
    }

}

struct InfoView_Previews: PreviewProvider {
    
    static let mock: Recipe = .fixture()
    
    static var previews: some View {
        RecipeInfoView(portions: mock.portions, difficulty: mock.difficulty, rating: mock.rating, preparationTime: mock.preparationTime)
    }
}
