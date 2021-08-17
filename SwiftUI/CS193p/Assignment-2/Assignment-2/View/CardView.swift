//
//  CardView.swift
//  Assignment-2
//
//  Created by Vinícius Couto on 17/07/21.
//

import SwiftUI

struct CardView: View {
    let card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)

                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)

                    shape
                        .strokeBorder(lineWidth: DrawingConstants.lineWidth)

                    Text(card.content)
                        .font(font(in: geometry.size))
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

    private func font(in size: CGSize) -> Font {
        Font.system(size: DrawingConstants.fontScale * min(size.width, size.height))
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}
