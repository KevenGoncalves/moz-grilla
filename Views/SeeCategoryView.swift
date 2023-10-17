//
//  SeeCategoryView.swift
//  MozGrill
//
//  Created by Keven Goncalves on 17/10/23.
//

import SwiftUI

struct SeeCategoryView: View {
    var category : String
    var categoryDesc: String
    var recipes : [RecipeFood]
    var user: User?
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                TopBarComponent(title: category,user: user)
                Text(categoryDesc)
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                ScrollView{
                    RecipesList(recipes:recipes )
                }
            }
        }
    }
}

//struct SeeCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SeeCategoryView()
//    }
//}
