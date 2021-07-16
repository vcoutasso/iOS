//
//  ContentView.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 16/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGameManager

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

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)

                shape
                    .strokeBorder(lineWidth: 3)

                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape
                    .opacity(0)
            } else {
                shape
                    .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGameManager()
    static var previews: some View {
        ContentView(viewModel: game)
    }
}
