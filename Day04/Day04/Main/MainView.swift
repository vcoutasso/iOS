//
//  MainView.swift
//  Day04
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct MainView: View {
    
    @State var searchText: String = ""
    
    let recipes: [Recipe]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack(alignment: .top) {
                    Spacer()
                    VStack(spacing: 0) {
                        // Header
                        MainHeaderView()
                        
                        Spacer()
                        
                        // Search bar
                        MainSearchBarView(searchText: $searchText)
                            .padding(.bottom, 50)
                        
                        Spacer()
                        
                        // Recipe sections
                        MainRecipeSection(sectionName: "Café da manhã", recipes: recipes, filter: searchText)
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .accentColor(Color("highlight-text"))
    }
}

struct MainView_Previews: PreviewProvider {
    
    static let mock: Recipe = .fixture()
    
    static var previews: some View {
        MainView(recipes: [mock, mock])
    }
}

