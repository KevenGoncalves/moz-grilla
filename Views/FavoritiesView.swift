//
//  FavoritiesView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct FavoritiesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var recipes: [RecipeFood] = []
    
    var user : User?
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                TopBarComponent(title: "Favoritos",user: user)
                Text("Aqui tem as suas refeições favoritas")
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                ScrollView{
                    RecipesList(recipes: recipes)
                }
                .onAppear{
                    recipes = DataController().getAllRecipe(context: managedObjectContext).filter{ $0.favorite == true}
                }
            }
        }
    }
}

struct FavoritiesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritiesView()
    }
}
