//
//  HomeView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var recipes: [RecipeFood] = []
    
    var user : User?
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                TopBarComponent(title: "Bem Vindo",user: user)
                Text("\(recipes.count) Minhas Refeições")
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                ScrollView{
                    RecipesList(recipes: Array(recipes.prefix(4)))
                }
            }
            .onAppear{
                recipes = DataController().getAllRecipe(context: managedObjectContext)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
