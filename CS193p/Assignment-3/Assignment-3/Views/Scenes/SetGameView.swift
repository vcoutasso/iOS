//
//  SetGameView.swift
//  Assignment-3
//
//  Created by Vinícius Couto on 17/07/21.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetGameManager
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AspectVGrid(items: viewModel.cardsOnTable, aspectRatio: 3/4) { card in
                    CardView(viewModel: CardManager(card: card, failedMatchAttempt: viewModel.failedAttempt))
                        .onTapGesture {
                            viewModel.select(card)
                        }
                        .padding(geometry.size.width * LayoutMetrics.paddingFactor)
                }
                Spacer()

                Button {
                    viewModel.deal()
                } label: {
                    Text("Deal 3 More Cards")
                }.disabled(viewModel.isDeckEmpty)
            }
        }
    }

    private enum LayoutMetrics {
        static let paddingFactor: CGFloat = 0.01
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: .init())
    }
}
