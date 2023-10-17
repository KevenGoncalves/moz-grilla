//
//  CategoryCardComponent.swift
//  MozGrill
//
//  Created by Keven Goncalves on 15/10/23.
//

import SwiftUI

struct CategoryCardComponent: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var recipes: [RecipeFood] = []
    
    var category: String
    var categoryDisc: String
    var img: String
    
    var body: some View {
        NavigationLink {
            SeeCategoryView(category: category, categoryDesc: categoryDisc, recipes:recipes.filter{$0.category == category} )
        } label: {
            HStack(alignment:.center){
                Image(systemName: img)
                    .foregroundColor(.accentColor)
                    .font(.largeTitle)
                
                VStack(alignment:.leading){
                    Text(category)
                        .font(.title2)
                        .bold()
                    
                    Text(categoryDisc)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 320,alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(20)
            .padding(.top)
        }.onAppear{
            recipes = DataController().getAllRecipe(context: managedObjectContext)
        }
    }
}

struct CategoryCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardComponent(category: "Lanche", categoryDisc: "del", img:"carrot.fill")
    }
}
