//
//  ContentView.swift
//  Assignment-1
//
//  Created by Vinรญcius Couto on 16/07/21.
//

import SwiftUI

enum Theme: String {
    case vehicles = "Vehicles"
    case animals = "Animals"
    case food = "Food"
}

struct Emojis {
    static let vehicles: [String] = ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ป", "๐", "๐", "๐", "๐ต", "๐", "๐ก", "๐ ", "๐", "๐", "๐", "๐", "โ๏ธ", "๐"]
    static let animals: [String] = ["๐ถ", "๐ฑ", "๐ญ", "๐น", "๐ฐ", "๐ฆ", "๐ป", "๐ผ", "๐ปโโ๏ธ", "๐จ", "๐ฏ", "๐ฆ", "๐ฎ", "๐ท", "๐ธ", "๐ต", "๐", "๐ง", "๐ฆ", "๐ค", "๐ฆ", "๐ฆ", "๐ฆ"]
    static let food: [String] = ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ซ", "๐", "๐", "๐", "๐ฅญ", "๐", "๐ฅฅ", "๐ฅ", "๐", "๐", "๐ฅ", "๐ฅฆ", "๐ฅฌ", "๐ฅ", "๐ฝ", "๐ฅ"]
}

struct ContentView: View {

    @State var theme: Theme = .vehicles
    @State var emojis = Emojis.vehicles

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }

            Spacer()

            HStack {
                themeButton(theme: .vehicles, imageName: "car")
                themeButton(theme: .animals, imageName: "hare")
                themeButton(theme: .food, imageName: "leaf")
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }

    func themeButton(theme: Theme, imageName: String) -> some View {
        Button {
            self.theme = theme
            self.emojis = (self.theme == .vehicles ? Emojis.vehicles : self.theme == .animals ? Emojis.animals : Emojis.food)
                .shuffled()
        } label: {
            VStack(alignment: .center) {
                Image(systemName: imageName)
                    .frame(width: 50, height: 35)
                Text(theme.rawValue)
                    .font(.caption2)
            }
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)

                shape
                    .strokeBorder(lineWidth: 3)

                Text(content)
                    .font(.largeTitle)
            }
            else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
