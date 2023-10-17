//
//  RecipesList.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct RecipesList: View {
    var recipes: [RecipeFood]
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 165),spacing: 0)]) {
            ForEach(recipes) { recipe in
                NavigationLink(destination:RecipeModal(recipe: recipe)){
                    RecipeCardComponent(recipe: recipe)
                }
            }
            
        }
    }
}

//struct RecipesList_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipesList()
//    }
//}
