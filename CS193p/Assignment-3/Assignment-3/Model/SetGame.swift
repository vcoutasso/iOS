//
//  SetGame.swift
//  Assignment-3
//
//  Created by Vinícius Couto on 17/07/21.
//

import Foundation

struct SetGame {
    var cards: [Card]

    struct Card {
        let numShapes: Int
        let shape: Shape
        let color: Color
        let shading: Shading

        enum Shape {
            case diamond
            case squiggle
            case capsule
        }

        enum Color {
            case green
            case blue
            case pink
        }

        enum Shading {
            case striped
            case solid
            case open
        }
    }
}
