//
//  CardManager.swift
//  Assignment-3
//
//  Created by Vinícius Couto on 17/07/21.
//

import SwiftUI

class CardManager: ObservableObject {

    // MARK: - Type Aliases

    typealias Card = SetGame.Card

    // MARK: - Constants and Variables

    let card: Card

    var cardColor: Color {
        switch card.color {
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .pink:
            return Color.pink
        }
    }

    // MARK: - Initialization

    init(card: Card) {
        self.card = card
    }

    // MARK: - Methods
    
}
