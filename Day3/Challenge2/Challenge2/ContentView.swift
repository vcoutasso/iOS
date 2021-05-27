//
//  ContentView.swift
//  Challenge2
//
//  Created by Vinícius Couto on 27/05/21.
//

import SwiftUI

struct JrMentor: Identifiable {
    let id = UUID()
    let name: String
    let title: String
    let symbolName: String
}

struct MentorSectionView: View {
    let title: String
    let mentors: [JrMentor]
    
    var body: some View {
        Section(header: Text(title).foregroundColor(.secondary)) {
            ForEach(mentors) { mentor in
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: mentor.symbolName)
                        VStack(alignment: .leading) {
                            Text(mentor.name)
                                .foregroundColor(.primary)
                            Text(mentor.title)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    let jrMentors = [
        JrMentor(name: "Duda", title: "CEO @ Eduarda Mello Co.", symbolName: "umbrella"),
        JrMentor(name: "Enzo", title: "Drinks guy", symbolName: "eyes"),
        JrMentor(name: "Forbs", title: "Founder of Vector Race", symbolName: "cart"),
        JrMentor(name: "Mari", title: "Designer", symbolName: "newspaper"),
        JrMentor(name: "Pastre", title: "Master programmer @ PicPay", symbolName: "arrowshape.bounce.right"),
        JrMentor(name: "Ronaldo", title: "Brazilian Pro Soccer Player", symbolName: "link"),
        JrMentor(name: "Vini", title: "Person that exists", symbolName: "person"),
    ]
    
    var body: some View {
        List {
            MentorSectionView(title: "JR MENTORS 1", mentors: Array(jrMentors[..<3]))
            MentorSectionView(title: "JR MENTORS 2", mentors: Array(jrMentors[3...]))
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
