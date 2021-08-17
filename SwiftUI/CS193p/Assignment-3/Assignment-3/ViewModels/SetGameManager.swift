//
//  SetGameManager.swift
//  Assignment-3
//
//  Created by Vinícius Couto on 18/07/21.
//

import SwiftUI

class SetGameManager: ObservableObject {

    // MARK: - Type Aliases

    typealias Card = SetGame.Card

    // MARK: - Published Variables

    @Published private var model: SetGame

    @Published var score: Int = 0

    // MARK: - Computed Variables

    var deck: [Card] {
        model.cards
    }

    var cardsOnTable: [Card] {
        Array(deck.filter({ !$0.isMatched }).prefix(maxCardsOnTable + additionalCardsOnTable))
    }

    var isDeckEmpty: Bool {
        deck.filter({ !$0.isMatched }).count == 0
    }

    var failedAttempt: Bool {
        model.numSelectedCards == 3
    }

    // MARK: - Constants

    private let maxCardsOnTable = 12

    // MARK: - Variables

    private var additionalCardsOnTable = 0

    // MARK: - Initialization

    init(maxShapes: Int = Constants.defaultMaxShapes) {
        model = SetGame(maxShapes: maxShapes)
    }

    // MARK: - User Intents

    func deal() {
        additionalCardsOnTable += 3
        objectWillChange.send()
    }

    func select(_ card: Card) {
        if model.choose(card) {
            score += 10
            if additionalCardsOnTable > 0 { additionalCardsOnTable -= 3 }
        }
    }
}
