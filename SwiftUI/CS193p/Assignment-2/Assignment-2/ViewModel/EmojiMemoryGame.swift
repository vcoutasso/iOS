//
//  EmojiMemoryGame.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 16/07/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    // MARK: - Type Aliases

    typealias Card = MemoryGame<String>.Card
    typealias Theme = MemoryGame<String>.Theme

    // MARK: - Type Variables

    static private let themes: [Theme] = [
        EmojiThemes.animals,
        EmojiThemes.food,
        EmojiThemes.halloween,
        EmojiThemes.smileys,
        EmojiThemes.tools,
        EmojiThemes.vehicles,
    ]

    // MARK: - Type Functions

    static private func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            theme.contents[pairIndex]
        }
    }

    static private func newTheme() -> Theme {
        var theme = EmojiMemoryGame.themes.randomElement()!

        if theme.numberOfPairs > theme.contents.count {
            theme.numberOfPairs = theme.contents.count
        } else {
            theme.contents.shuffle()
        }

        // Drop duplicates
        theme.contents = Array(Set(theme.contents))

        return theme
    }

    // MARK: - Published Variables

    @Published private var model: MemoryGame<String>
    @Published var score = 0

    // MARK: - Variables

    var theme: Theme

    var cards: Array<Card> {
        model.cards
    }

    // MARK: - Initialization

    init() {
        theme = EmojiMemoryGame.newTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }

    // MARK: - Functions

    func getCardColor() -> Color {
        switch theme.themeColorName {
        case "red":
            return .red
        case "pink":
            return .pink
        case "green":
            return .green
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "gray":
            return .gray
        default:
            return .black
        }
    }

    // MARK: - User Intents

    func choose(_ card: Card) {
        if !card.isMatched {
            let wasSeen = card.previouslySeen
            let matched = model.choose(card)

            if matched {
                score += 2
            }
            else if wasSeen {
                score -= 1
            }
        }
    }

    func newGame() {
        theme = EmojiMemoryGame.newTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
        score = 0
    }
}
