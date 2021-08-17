//
//  MemoryGame.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 16/07/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {

    // MARK: - Private Variables

    private(set) var cards: Array<Card>

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    // MARK: - Mutating Functions

    mutating func choose(_ card: Card) -> Bool {
        var matched: Bool = false

        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            cards[chosenIndex].previouslySeen = true

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    matched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }

        return matched
    }

    // MARK: - Initialization

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }

        cards.shuffle()
    }

    // MARK: - Card Struct

    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var previouslySeen = false
        var content: CardContent
        var id: Int
    }

    // MARK: - Theme Struct

    struct Theme {
        let name: String
        var contents: [CardContent]
        var numberOfPairs: Int
        let themeColorName: String
    }

}

extension Array {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
