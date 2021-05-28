//
//  ContentView.swift
//  Challenge1
//
//  Created by Vinícius Couto on 27/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Me aperte", destination: Text("Deu boa!"))
                .navigationTitle("Coleção")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
