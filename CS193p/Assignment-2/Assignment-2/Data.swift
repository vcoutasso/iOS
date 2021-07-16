//
//  Data.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 16/07/21.
//

import Foundation

struct EmojiThemes {
    static let vehicles = MemoryGame<String>.Theme(name: "Vehicles",
                                                   contents: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🏍", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "✈️", "🚁"],
                                                   numberOfPairs: 12,
                                                   themeColorName: "red")

    static let animals = MemoryGame<String>.Theme(name: "Animals",
                                                  contents: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🦆", "🦅", "🦉"],
                                                  numberOfPairs: 12,
                                                  themeColorName: "pink")

    static let food = MemoryGame<String>.Theme(name: "Food",
                                               contents: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌽", "🥕"],
                                               numberOfPairs: 12,
                                               themeColorName: "green")

    static let halloween = MemoryGame<String>.Theme(name: "Halloween",
                                                    contents: ["🎃", "👻", "💀", "🦇", "🧙‍♀️", "🧹"],
                                                    numberOfPairs: 6,
                                                    themeColorName: "orange")

    static let smileys = MemoryGame<String>.Theme(name: "Smileys",
                                                  contents: ["🥺", "🤗", "😬", "😲", "🥴", "😵", "🤠", "🤫"],
                                                  numberOfPairs: 8,
                                                  themeColorName: "yellow")


    static let tools = MemoryGame<String>.Theme(name: "Tools",
                                                contents: ["🪛", "🔧", "🔨", "⛏", "🛠", "🪚", "⚙️", "🔩", "🪓"],
                                                numberOfPairs: 12,
                                                themeColorName: "gray")

}
