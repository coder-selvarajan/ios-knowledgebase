//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-02-03.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        
        
        TabView (selection: $tabSelection) {
            
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
            
            AddRecipeView(tabSelection: $tabSelection)
                .tabItem {
                    VStack {
                        Image(systemName: "plus.circle")
                        Text("Add")
                    }
                }
                .tag(Constants.addRecipeTab)
        }
        .environmentObject(RecipeModel())
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
