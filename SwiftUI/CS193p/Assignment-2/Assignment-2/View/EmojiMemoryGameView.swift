//
//  EmojiMemoryGameView.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 16/07/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {

            HStack {
                Text(viewModel.theme.name)
                    .font(.title)
                    .fontWeight(.heavy)

                Spacer()

                Text("Score: \(viewModel.score)")
                    .font(.body)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.getCardColor())
            .padding(.horizontal)

            Button {
                viewModel.newGame()
            } label: {
                Text("New Game")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    static var previews: some View {
        EmojiMemoryGameView(viewModel: game)
    }
}
