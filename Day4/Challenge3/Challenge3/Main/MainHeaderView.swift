//
//  MainHeaderView.swift
//  Challenge3
//
//  Created by Vinícius Couto on 30/05/21.
//

import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        // Header
        VStack(spacing: -50) {
            VStack {
                Image("avatar")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .trailing)
                    .clipShape(Circle())
                    .clipped()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
                
            Text("""
            O que \n\
            \(Text("cozinhar")
                .fontWeight(.bold)
                .foregroundColor(Color("highlight-text"))) \
            hoje?
            """)
                .font(.system(size: 48, weight: .regular, design: .serif))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView()
    }
}
