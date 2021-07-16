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

    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    // MARK: - Mutating Functions

    mutating func choose(_ card: Card) -> Bool {
        var matched: Bool = false

        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    matched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].previouslySeen = true
            cards[chosenIndex].isFaceUp.toggle()
        }

        return matched
    }

    // MARK: - Initialization

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }

        cards.shuffle()
    }

    // MARK: - Card Struct

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var previouslySeen: Bool = false
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
