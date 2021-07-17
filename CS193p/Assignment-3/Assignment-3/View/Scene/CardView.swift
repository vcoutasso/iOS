//
//  CardView.swift
//  Assignment-3
//
//  Created by Vinícius Couto on 17/07/21.
//

import SwiftUI

struct CardView: View {
    // MARK: - Type Aliases

    typealias Card = SetGame.Card

    // MARK: - Observed Objects

    @ObservedObject var viewModel: CardManager

    // MARK: - Body

    var body: some View {
        VStack {
            ForEach(0..<viewModel.card.numShapes) { _ in
                cardShape
                    .aspectRatio(LayoutMetrics.aspectRatio, contentMode: .fit)
                    .padding()
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Private Functions

    @ViewBuilder
    private var cardShape: some View {
        GeometryReader { geometry in
        switch viewModel.card.shape {
        case .diamond:
            Diamond()
                .stroke(viewModel.cardColor, lineWidth: LayoutMetrics.lineWidth)
                .background(fillStyle(in: geometry.size))
                .mask(Diamond())
        case .squiggle:
            Squiggle()
                .stroke(viewModel.cardColor, lineWidth: LayoutMetrics.lineWidth)
                .background(fillStyle(in: geometry.size))
                .mask(Squiggle())
        case .capsule:
            Capsule()
                .stroke(viewModel.cardColor, lineWidth: LayoutMetrics.lineWidth)
                .background(fillStyle(in: geometry.size))
                .mask(Capsule())
        }
        }
    }

    @ViewBuilder
    private func fillStyle(in rect: CGSize) -> some View {
        let numStripes = Int(rect.width * LayoutMetrics.stripesFactor)

        switch viewModel.card.shading {
        case .striped:
            // Draw evenly spaced stripes
            HStack(spacing: rect.width / CGFloat((numStripes * 2))) {
                ForEach(0..<numStripes) { _ in
                    Rectangle()
                        .fill(viewModel.cardColor)
                }
            }
        case .solid:
            viewModel.cardColor
        case .open:
            Color.white.opacity(0)
        }
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let aspectRatio: CGFloat = 2
        static let lineWidth: CGFloat = 5
        static let stripesFactor: CGFloat = 0.1
    }
}

struct CardView_Previews: PreviewProvider {

    static private let mockViewModel = CardManager(card: SetGame.Card(numShapes: 3, shape: .diamond, color: .blue, shading: .open)
        )

    static var previews: some View {
        CardView(viewModel: mockViewModel)
            .preferredColorScheme(.light)
    }
}
