//
//  FruitMock.swift
//  Challenge
//
//  Created by Vinícius Couto on 30/05/21.
//

import Foundation
import SwiftUI

#if DEBUG
extension Fruit {
    static func fixture(
        name: String = "Blueberry",
        shortDescription: String = "Blueberries are sweet, nutritious and wildly popular all over the world.",
        longDescription: String =
            """
            Blueberries are perennial flowering plants with blue or purple berries. They are classified in the section Cyanococcus within the genus Vaccinium. Vaccinium also includes cranberries, bilberries, huckleberries and Madeira blueberries. Commercial blueberries—both wild (lowbush) and cultivated (highbush)—are all native to North America. The highbush varieties were introduced into Europe during the 1930s
            """,
        energy: Int = 29,
        sugar: Double = 2.5,
        fat: Double = 0.3,
        protein: Double = 1.1,
        vitamins: [Vitamin] = [
            .B1,
            .B2,
            .B3,
            .B5,
            .B6,
            .B9,
            .C,
            .Choline,
        ],
        imageName: String = "blueberry",
        bgGradientLower: Color = Color("blueberry-bg-lower"),
        bgGradientUpper: Color = Color("blueberry-bg-upper")
    ) -> Fruit {
        .init(name: name, shortDescription: shortDescription, longDescription: longDescription, energy: energy, sugar: sugar, fat: fat, protein: protein, vitamins: vitamins, imageName: imageName, bgGradientLower: bgGradientLower, bgGradientUpper: bgGradientUpper)
    }
}
#endif
