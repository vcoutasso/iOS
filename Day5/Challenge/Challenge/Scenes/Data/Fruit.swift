//
//  Fruit.swift
//  Challenge
//
//  Created by Vinícius Couto on 30/05/21.
//

import Foundation
import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    
    let name: String
    let shortDescription: String
    let longDescription: String
    
    // Nutritional info
    let energy: Int // kcal
    let sugar: Double // g
    let fat: Double // g
    let protein: Double // g
    let vitamins: [Vitamin]
    
    let imageName: String
    let bgGradientLower: Color
    let bgGradientUpper: Color
}
