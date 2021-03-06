//
//  Data.swift
//  Assignment-2
//
//  Created by Vinรญcius Couto on 16/07/21.
//

import Foundation

struct EmojiThemes {
    static let vehicles = MemoryGame<String>.Theme(name: "Vehicles",
                                                   contents: ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ป", "๐", "๐", "๐", "๐ต", "๐", "๐ก", "๐ ", "๐", "๐", "๐", "๐", "โ๏ธ", "๐"],
                                                   numberOfPairs: 12,
                                                   themeColorName: "red")

    static let animals = MemoryGame<String>.Theme(name: "Animals",
                                                  contents: ["๐ถ", "๐ฑ", "๐ญ", "๐น", "๐ฐ", "๐ฆ", "๐ป", "๐ผ", "๐ปโโ๏ธ", "๐จ", "๐ฏ", "๐ฆ", "๐ฎ", "๐ท", "๐ธ", "๐ต", "๐", "๐ง", "๐ฆ", "๐ค", "๐ฆ", "๐ฆ", "๐ฆ"],
                                                  numberOfPairs: 12,
                                                  themeColorName: "pink")

    static let food = MemoryGame<String>.Theme(name: "Food",
                                               contents: ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ซ", "๐", "๐", "๐", "๐ฅญ", "๐", "๐ฅฅ", "๐ฅ", "๐", "๐", "๐ฅ", "๐ฅฆ", "๐ฅฌ", "๐ฅ", "๐ฝ", "๐ฅ"],
                                               numberOfPairs: 12,
                                               themeColorName: "green")

    static let halloween = MemoryGame<String>.Theme(name: "Halloween",
                                                    contents: ["๐", "๐ป", "๐", "๐ฆ", "๐งโโ๏ธ", "๐งน"],
                                                    numberOfPairs: 6,
                                                    themeColorName: "orange")

    static let smileys = MemoryGame<String>.Theme(name: "Smileys",
                                                  contents: ["๐ฅบ", "๐ค", "๐ฌ", "๐ฒ", "๐ฅด", "๐ต", "๐ค ", "๐คซ"],
                                                  numberOfPairs: 8,
                                                  themeColorName: "yellow")


    static let tools = MemoryGame<String>.Theme(name: "Tools",
                                                contents: ["๐ช", "๐ง", "๐จ", "โ", "๐ ", "๐ช", "โ๏ธ", "๐ฉ", "๐ช"],
                                                numberOfPairs: 12,
                                                themeColorName: "gray")

}
