//
//  Diamond.swift
//  Assignment-3
//
//  Created by Vinícius Couto on 17/07/21.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let topmost = CGPoint(x: rect.midX, y: rect.minY)
        let leftmost = CGPoint(x: rect.minX, y: rect.midY)
        let bottommost = CGPoint(x: rect.midX, y: rect.maxY)
        let rightmost = CGPoint(x: rect.maxX, y: rect.midY)

        path.move(to: topmost)

        path.addLine(to: leftmost)
        path.addLine(to: bottommost)
        path.addLine(to: rightmost)
        path.addLine(to: topmost)

        return path
    }
}

struct DiamondView_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
            .scaledToFit()
    }
}
