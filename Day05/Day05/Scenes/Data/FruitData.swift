//
//  FruitData.swift
//  Day05
//
//  Created by Vinícius Couto on 02/06/21.
//

import Foundation
import SwiftUI

func getFruitData() -> Result<[Fruit], DataError> {
    let fruitData = [
        Fruit(
            name: "Strawberry",
            shortDescription: "Widely appreciated for its characteristic aroma,  red color, juicy texture, and sweetness.",
            longDescription:
                """
                The garden strawberry (or simply strawberry; Fragaria × ananassa) is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness. It is consumed in large quantities, either fresh or in such prepared foods as jam, juice, pies, ice cream, milkshakes, and chocolates. Artificial strawberry flavorings and aromas are also widely used in products such as candy, soap, lip gloss, perfume, and many others.
                The strawberry is not, from a botanical point of view, a berry. Technically, it is an aggregate accessory fruit, meaning that the fleshy part is derived not from the plant's ovaries but from the receptacle that holds the ovaries. Each apparent "seed" (achene) on the outside of the fruit is actually one of the ovaries of the flower, with a seed inside it.
                """,
            energy: 33,
            sugar: 4.89,
            fat: 0.3,
            protein: 0.67,
            vitamins: [
                .B1,
                .B2,
                .B3,
                .B5,
                .B6,
                .B9,
                .C,
                .E,
                .K,
                .Choline,
                ],
            imageName: "strawberry",
            bgGradientLower: Color("strawberry-bg-lower"),
            bgGradientUpper: Color("strawberry-bg-upper")
            ),
        Fruit(
            name: "Lemon",
            shortDescription: "There's no doubt lemons are delicious, but does adding them to water make you healthier?",
            longDescription:
                """
                The lemon, Citrus limon, is a species of small evergreen tree in the flowering plant family Rutaceae, native to South Asia, primarily North eastern India. Its fruits are round in shape.
                The tree's ellipsoidal yellow fruit is used for culinary and non-culinary purposes throughout the world, primarily for its juice, which has both culinary and cleaning uses. The pulp and rind are also used in cooking and baking. The juice of the lemon is about 5% to 6% citric acid, with a pH of around 2.2, giving it a sour taste. The distinctive sour taste of lemon juice makes it a key ingredient in drinks and foods such as lemonade and lemon meringue pie.
                """,
            energy: 29,
            sugar: 2.5,
            fat: 0.3,
            protein: 1.1,
            vitamins: [
                .B1,
                .B2,
                .B3,
                .B5,
                .B6,
                .B9,
                .C,
                .Choline,
                ],
            imageName: "lemon",
            bgGradientLower: Color("lemon-bg-lower"),
            bgGradientUpper: Color("lemon-bg-upper")
            ),
        Fruit(
            name: "Lime",
            shortDescription: "Sour, round, and bright green citrus fruits. Limes are high in vitamin C, antioxidants, and other nutrients.",
            longDescription:
                """
                A lime (from French lime, from Arabic līma, from Persian līmū, "lemon") is a citrus fruit, which is typically round, green in color, 3–6 centimetres (1.2–2.4 in) in diameter, and contains acidic juice vesicles.
                There are several species of citrus trees whose fruits are called limes, including the Key lime (Citrus aurantiifolia), Persian lime, kaffir lime, and desert lime. Limes are a rich source of vitamin C, are sour, and are often used to accent the flavours of foods and beverages. They are grown year-round. Plants with fruit called "limes" have diverse genetic origins; limes do not form a monophyletic group.
                """,
            energy: 30,
            sugar: 1.7,
            fat: 0.2,
            protein: 0.7,
            vitamins: [
                .B1,
                .B2,
                .B3,
                .B5,
                .B6,
                .B9,
                .C,
                ],
            imageName: "lime",
            bgGradientLower: Color("lime-bg-lower"),
            bgGradientUpper: Color("lime-bg-upper")
            ),
        Fruit(
            name: "Blueberry",
            shortDescription: "Blueberries are sweet, nutritious and wildly popular all over the world.",
            longDescription:
                """
                Blueberries are perennial flowering plants with blue or purple berries. They are classified in the section Cyanococcus within the genus Vaccinium. Vaccinium also includes cranberries, bilberries, huckleberries and Madeira blueberries. Commercial blueberries—both wild (lowbush) and cultivated (highbush)—are all native to North America. The highbush varieties were introduced into Europe during the 1930s
                """,
            energy: 57,
            sugar: 9.96,
            fat: 0.33,
            protein: 0.74,
            vitamins: [
                .B1,
                .B2,
                .B3,
                .B5,
                .B6,
                .B9,
                .C,
                .E,
                .K,
                ],
            imageName: "blueberry",
            bgGradientLower: Color("blueberry-bg-lower"),
            bgGradientUpper: Color("blueberry-bg-upper")
            ),
        Fruit(
            name: "Cherry",
            shortDescription: "Sweet, bell-shaped fruits that have been enjoyed since ancient times. They can be eaten crisp or soft.",
            longDescription: """
                A cherry is the fruit of many plants of the genus Prunus, and is a fleshy drupe (stone fruit). Commercial cherries are obtained from cultivars of several species, such as the sweet Prunus avium and the sour Prunus cerasus.
                The name 'cherry' also refers to the cherry tree and its wood, and is sometimes applied to almonds and visually similar flowering trees in the genus Prunus, as in "ornamental cherry" or "cherry blossom". Wild cherry may refer to any of the cherry species growing outside cultivation, although Prunus avium is often referred to specifically by the name "wild cherry" in the British Isles.
                """,
            energy: 50,
            sugar: 8.5,
            fat: 0.3,
            protein: 1,
            vitamins: [
                .B1,
                .B2,
                .B3,
                .B5,
                .B6,
                .B9,
                .C,
                .K,
                ],
            imageName: "cherry",
            bgGradientLower: Color("cherry-bg-lower"),
            bgGradientUpper: Color("cherry-bg-upper")
            ),
    ]
    
    return fruitData is [Fruit] ? .success(fruitData) : .failure(DataError.InvalidData)
}

