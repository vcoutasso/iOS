//
//  RecipeSectionView.swift
//  Day04
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct RecipeSectionView: View {
    
    let title: String
    let elements: [String]
    
    let useBulletPoints: Bool
    private let bulletPoint: String = "\u{2022}"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .bold, design: .serif))
                .foregroundColor(Color("primary-text"))
                .padding(.bottom, 6)
            ForEach(elements.indices, id: \.self) { index in
                HStack(alignment: .firstTextBaseline) {
                    if useBulletPoints {
                        Text(bulletPoint)
                        Text(elements[index])
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    else {
                        Text("\(index + 1).")
                        Text(elements[index])
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.leading, 6)
                            .padding(.bottom, 14)
                    }
                }
                .padding(.leading)
                .font(.system(size: 14, weight: .regular, design: .serif))
                .foregroundColor(Color("secondary-text"))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct SectionView_Previews: PreviewProvider {
    
    static let mock: Recipe = .fixture()
    
    static var previews: some View {
        VStack {
            RecipeSectionView(title: "Header 1", elements: mock.ingredients, useBulletPoints: true)
            RecipeSectionView(title: "Header 2", elements: mock.preparationSteps, useBulletPoints: false)
        }
    }
}
