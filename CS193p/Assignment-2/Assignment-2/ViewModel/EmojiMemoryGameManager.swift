//
//  EmojiMemoryGameManager.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 16/07/21.
//

import SwiftUI

class EmojiMemoryGameManager: ObservableObject {

    // MARK: - Type Variables

    static let themes: [MemoryGame<String>.Theme] = [
        EmojiThemes.animals,
        EmojiThemes.food,
        EmojiThemes.halloween,
        EmojiThemes.smileys,
        EmojiThemes.tools,
        EmojiThemes.vehicles,
    ]

    // MARK: - Type Functions

    static private func createMemoryGame(theme: MemoryGame<String>.Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            theme.contents[pairIndex]
        }
    }

    static private func newTheme() -> MemoryGame<String>.Theme {
        var theme = EmojiMemoryGameManager.themes.randomElement()!

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
    @Published var score: Int = 0

    // MARK: - Variables

    var theme: MemoryGame<String>.Theme

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK: - Initialization

    init() {
        theme = EmojiMemoryGameManager.newTheme()
        model = EmojiMemoryGameManager.createMemoryGame(theme: theme)
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

    func choose(_ card: MemoryGame<String>.Card) {
        let wasKnown = card.previouslySeen
        let matched = model.choose(card)

        if matched {
            score += 2
        }
        else if wasKnown {
            score -= 1
        }
    }

    func newGame() {
        theme = EmojiMemoryGameManager.newTheme()
        model = EmojiMemoryGameManager.createMemoryGame(theme: theme)
        score = 0
    }
}
