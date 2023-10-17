//
//  DiscoveryView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct DiscoveryView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var recipes: [RecipeFood] = []
    
    var user : User?
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                TopBarComponent(title: "Descubra",user: user)
                Text("Descubra as mais diversas receitas")
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                ScrollView{
                    RecipesList(recipes: recipes)
                }
            }.onAppear{
                recipes = DataController().getAllRecipe(context: managedObjectContext)
            }
        }
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
