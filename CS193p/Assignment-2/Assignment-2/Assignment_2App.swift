//
//  Assignment_2App.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 16/07/21.
//

import SwiftUI

@main
struct Assignment_2App: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
