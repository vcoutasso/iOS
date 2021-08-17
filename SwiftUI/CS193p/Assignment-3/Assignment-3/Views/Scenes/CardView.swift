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
        HStack {
            Spacer()

            VStack {
                Spacer()

                ForEach(0..<viewModel.card.numShapes, id: \.self) { _ in
                    cardShape
                        .aspectRatio(LayoutMetrics.aspectRatio, contentMode: .fit)

                    Spacer()
                }
            }

            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius)
                .stroke(lineWidth: LayoutMetrics.outerLineWidth)
                .foregroundColor(borderColor)
                .shadow(color: .gray,
                        radius: LayoutMetrics.shadowRadius,
                        x: LayoutMetrics.shadowOffsetX,
                        y: LayoutMetrics.shadowOffsetY)
        )
    }

    // MARK: - Private Variables

    private var borderColor: Color {
        viewModel.isCardSelected ? viewModel.failedMatchAttempt ? Color.red : Color.orange : Color.white
    }

    @ViewBuilder
    private var cardShape: some View {
        GeometryReader { geometry in
            switch viewModel.card.shape {
            case .diamond:
                Diamond()
                    .stroke(viewModel.cardColor, lineWidth: LayoutMetrics.shapeLineWidth)
                    .background(fillStyle(in: geometry.size))
                    .mask(Diamond())
            case .squiggle:
                Squiggle()
                    .stroke(viewModel.cardColor, lineWidth: LayoutMetrics.shapeLineWidth)
                    .background(fillStyle(in: geometry.size))
                    .mask(Squiggle())
            case .capsule:
                Capsule()
                    .stroke(viewModel.cardColor, lineWidth: LayoutMetrics.shapeLineWidth)
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
                ForEach(0..<numStripes, id: \.self) { _ in
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
        static let outerLineWidth: CGFloat = 1
        static let shapeLineWidth: CGFloat = 3
        static let stripesFactor: CGFloat = 0.3
        static let cornerRadius: CGFloat = 10
        static let shadowRadius: CGFloat = 1
        static let shadowOffsetX: CGFloat = 0
        static let shadowOffsetY: CGFloat = 1
    }
}

struct CardView_Previews: PreviewProvider {

    static private var mockCard = SetGame.Card(numShapes: 3, shape: .capsule, color: .blue, shading: .open)

    static private let mockViewModel = CardManager(card: mockCard)

    static var previews: some View {
        CardView(viewModel: mockViewModel)
            .frame(width: 100, height: 100)
            .preferredColorScheme(.light)
    }
}
