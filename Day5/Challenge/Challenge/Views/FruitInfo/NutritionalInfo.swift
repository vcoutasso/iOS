//
//  NutritionalInfo.swift
//  Challenge
//
//  Created by Vinícius Couto on 30/05/21.
//

import SwiftUI

struct NutritionalInfo: View {
    
    @Binding var expandNutritionalInfo: Bool
    let fruit: Fruit
    
    var body: some View {

    }
}

struct NutritionalInfo_Previews: PreviewProvider {
    
    @State static var expandGroup: Bool = true
    static let mockFruit: Fruit = .fixture()
    
    static var previews: some View {
        NutritionalInfo(expandNutritionalInfo: $expandGroup, fruit: mockFruit)
    }
}
