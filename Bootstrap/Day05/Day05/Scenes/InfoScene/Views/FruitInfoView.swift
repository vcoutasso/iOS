//
//  FruitInfoView.swift
//  Day05
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct FruitInfoView: View {
    
    let fruit: Fruit
    
    @State private var expandNutritionalInfo: Bool = false
    
    let infoSymbolName = "info.circle"
    
    var body: some View {
        ScrollView {
            VStack {
                headerImage()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Group {
                            pageTitle()
                            shortDescription()
                            nutritionalInformation()
                        }
                        .padding(.bottom)
                        longDescription()
                    }
                    
                    Spacer()
                }
            }
            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
    }

    private func headerImage() -> some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [fruit.bgGradientLower, fruit.bgGradientUpper]), startPoint: .bottom, endPoint: .top)
                
                Image(fruit.imageName)
                    .resizable()
                    .scaledToFill()
                    .padding()
                    .padding()
            }
            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
            .clipped()
            .offset(y: -geometry.frame(in: .global).minY)
        }
        .frame(height: UIScreen.main.bounds.height / 2)
    }

    private func pageTitle() -> some View {
        Text(fruit.name)
            .font(.system(.largeTitle, design: .default)
                    .weight(.bold))
            .foregroundColor(fruit.bgGradientLower)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
    
    private func shortDescription() -> some View {
        Text(fruit.shortDescription)
            .font(.system(.body, design: .default)
                    .weight(.bold))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private func nutritionalInformation() -> some View {
        DisclosureGroup(isExpanded: $expandNutritionalInfo) {
                disclosureGroupItem(name: "Energy", value: "\(Int(Double(fruit.energy) * 4.184)) kJ (\(fruit.energy) kcal)")
                    .padding(.top)
                
                disclosureGroupItem(name: "Sugar", value: "\(fruit.sugar) g")
                
                disclosureGroupItem(name: "Fat", value: "\(fruit.fat) g")
                
                disclosureGroupItem(name: "Protein", value: "\(fruit.protein) g")
                
                disclosureGroupItem(name: "Vitamins", value: "\(fruit.vitamins.map{ $0.rawValue }.joined(separator: ", "))")
        } label: {
            Text("Nutritional value per 100 g")
                .fontWeight(.bold)
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(8)
        .accentColor(.black)
    }
    
    private func disclosureGroupItem(name: String, value: String) -> some View {
        VStack {
            Divider()
            HStack {
                HStack {
                    Image(systemName: infoSymbolName)
                    Text(name)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text(value)
                    .foregroundColor(.black)
                    .frame(alignment: .trailing)
            }
            .font(.system(.body, design: .default)
                    .weight(.regular))
            .foregroundColor(Color("silver"))
        }
    }
    
    private func longDescription() -> some View {
        Group {
            Text("Learn more about the \(fruit.name)".uppercased())
                .font(.system(.body, design: .default)
                        .weight(.bold))
                .padding(.bottom)
            
            Text(fruit.longDescription)
                .font(.system(.subheadline, design: .default)
                        .weight(.regular))
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}

#if DEBUG
struct FruitInfo_Previews: PreviewProvider {
    
    static let mockFruit: Fruit = .fixture()
    
    static var previews: some View {
        FruitInfoView(fruit: mockFruit)
    }
}
#endif
