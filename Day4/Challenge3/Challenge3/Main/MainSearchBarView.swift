//
//  SearchBarView.swift
//  Challenge3
//
//  Created by Vinícius Couto on 28/05/21.
//

import SwiftUI

struct MainSearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                TextField("Search", text: $searchText)
                    .font(.system(size: 17, weight: .regular, design: .default))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(10)
                    .padding(.leading, 30)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                    )
                    .background(Color("search-bar-background"))
                    .foregroundColor(Color("search-bar-text"))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    
    @State static var searchText: String = ""
    
    static var previews: some View {
        MainSearchBarView(searchText: $searchText)
            .preferredColorScheme(.dark)
    }
}
