//
//  ContentView.swift
//  Challenge1
//
//  Created by Vinícius Couto on 27/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Simple Button") {
                // Action
            }
            .padding()
            
            Text("Text Color")
                .foregroundColor(.green)
                .padding()
            
            Text("Background Color")
                .padding()
                .background(Color(.green))
            
            HStack {
                Image(systemName: "trash")
                Text("Delete")
            }
            .foregroundColor(.blue)
            .padding()
            
            VStack {
                Image(systemName: "trash")
                Text("Delete")
            }
            .foregroundColor(.blue)
            .padding()
            
            Button("Rounded Button") {
                // Action
            }
            .padding()
            .background(Color(.green))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Rounded Button") {
                // Action
            }
            .padding()
            .foregroundColor(.blue)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue)
            )
            
            Button("Rounded Button") {
                // Action
            }
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
