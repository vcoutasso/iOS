//
//  ContentView.swift
//  Challenge1
//
//  Created by Vinícius Couto on 27/05/21.
//

import SwiftUI

struct ContentView: View {
    let mentors = [
        "Duda",
        "Enzo",
        "Forbs",
        "Mari",
        "Pastre",
        "Ronaldo",
        "Vini",
    ]
    
    var body: some View {
        List(mentors, id: \.self) { mentor in
            VStack(alignment: .leading) {
                Text(mentor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
