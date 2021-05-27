//
//  ContentView.swift
//  Challenge2
//
//  Created by Vinícius Couto on 27/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            Rectangle()
                .foregroundColor(.red)
            Rectangle()
                .foregroundColor(.green)
            Rectangle()
                .foregroundColor(.blue)
        }

        VStack {
            Rectangle()
                .foregroundColor(.red)
            Rectangle()
                .foregroundColor(.green)
            Rectangle()
                .foregroundColor(.blue)
        }

        ZStack {
            Rectangle()
                .fill(Color.red)
            Rectangle()
                .fill(Color.green)
                .offset(CGSize(width: 50, height: 50))
            Rectangle()
                .fill(Color.blue)
                .offset(CGSize(width: 100, height: 100))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
