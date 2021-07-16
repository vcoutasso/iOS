//
//  ContentView.swift
//  Day01
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct CardView: View {
    
    let symbol: String
    let title: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: symbol)
                    .font(.system(size: 40))
                    .foregroundColor(color)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16))
                        .bold()
                    Text(text)
                        .font(.system(size: 14))
                }
                .frame(minWidth: 0, maxWidth: 210)
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("What's New")
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .padding()
                .padding(.top, 80)
            
            CardView(symbol: "suit.heart.fill", title: "More Personalized", text: "Top Stories picked for you and recommendations from Siri.", color: Color.pink)
            
            CardView(symbol: "lineweight", title: "New Spotlight Tab", text: "Discover great stories selected by our editors.", color: Color.red)

            CardView(symbol: "newspaper", title: "Video in Today View", text: "The day's best videos, right in the News widget.", color: Color.blue)
            
            Spacer()

            Button("Next") {
                // Action
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.blue))
                    .frame(width: 300, height: 50, alignment: .center)
            )
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
