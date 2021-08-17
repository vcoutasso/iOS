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

    // MARK: - Constants

    let card: Card

    // MARK: - Variables

    let failedMatchAttempt: Bool

    // MARK: - Computed Variables

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

    var isCardSelected: Bool {
        card.isSelected
    }

    // MARK: - Initialization

    init(card: Card, failedMatchAttempt: Bool = false) {
        self.card = card
        self.failedMatchAttempt = failedMatchAttempt
    }

    // MARK: - Methods
    
}
