//
//  SetGame.swift
//  Assignment-3
//
//  Created by Vinícius Couto on 17/07/21.
//

import Foundation
import SwiftUI

struct SetGame {

    // MARK: - Variables

    private(set) var cards: [Card]

    // MARK: - Computed Variables

    private var selectedCards: [Card] {
        cards.filter { $0.isSelected }
    }

    var numSelectedCards: Int {
        selectedCards.count
    }

    // MARK: - Initalization

    init(maxShapes: Int = Constants.defaultMaxShapes) {
        cards = []

        // Populate card set
        for numShapes in 1...maxShapes {
            for shape in Card.Shape.allCases {
                for color in Card.Color.allCases {
                    for shading in Card.Shading.allCases {
                        cards.append(Card(numShapes: numShapes, shape: shape, color: color, shading: shading))
                    }
                }
            }
        }

        cards.shuffle()
    }

    // MARK: - Functions

    mutating func choose(_ card: Card) -> Bool {
        var isMatch = false

        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {

            // Clear selected cards if there are already 3
            if selectedCards.count == 3 {
                for selected in selectedCards {
                    if let selectedCardIndex = cards.firstIndex(where: { $0.id == selected.id }) {
                        cards[selectedCardIndex].isSelected = false
                    }
                }
            }
            
            cards[chosenIndex].isSelected.toggle()

            // If there were 2 and now there are 3 we will try to match them
            if selectedCards.count == 3 {
                if Set(selectedCards.map({ $0.numShapes })).count != 2 &&
                    Set(selectedCards.map({ $0.color })).count != 2 &&
                    Set(selectedCards.map({ $0.shading })).count != 2 &&
                    Set(selectedCards.map({ $0.shape })).count != 2
                {
                    isMatch = true
                    
                    for selected in selectedCards {
                        if let selectedCardIndex = cards.firstIndex(where: { $0.id == selected.id }) {
                            cards[selectedCardIndex].isMatched = true
                            cards[selectedCardIndex].isSelected = false
                        }
                    }
                }
            }
        }

        return isMatch
    }

    // MARK: - Structs

    struct Card: Identifiable {
        let numShapes: Int
        let shape: Shape
        let color: Color
        let shading: Shading
        
        var isSelected = false
        var isMatched = false

        var id = UUID()

        enum Shape: CaseIterable {
            case diamond
            case squiggle
            case capsule
        }

        enum Color: CaseIterable {
            case green
            case blue
            case pink
        }

        enum Shading: CaseIterable {
            case striped
            case solid
            case open
        }
    }
}

struct SetGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
